class CommentsController < ApplicationController
  before_action :set_event, only: %i[ create destroy ]
  before_action :set_comment, only: %i[ destroy ]

  def create
    @new_comment = @event.comments.build(comment_params)
    @new_comment.user = current_user

    if @new_comment.save
      notify_subscribers(@event, @new_comment)

      redirect_to @event, notice: t('controllers.comments.created')
    else
      render 'events/show', alert: t('controllers.comments.error')
    end
  end

  def destroy
    message = { notice: t('controllers.comments.destroyed') }

    if current_user_can_edit_event?(@comment)
      @comment.destroy!
    else
      message = { alert: t('controllers.comments.error') }
    end

    redirect_to @event, message
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_comment
    @comment = @event.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_name)
  end

  def notify_subscribers(event, comment)
    # собираем всех подписчиков и незареганных пользователей, подписавшихся на событи в массив мэйлов
    # all_emails = (event.subscribers.map(&:email)+event.subscriptions.map(&:user_email)).uniq
    all_emails = (event.subscribers.map(&:email)+event.subscriptions.map(&:user_email)+[event.user.email]).uniq

    # XXX: Этот метод может выполняться долго из-за большого числа подписчиков
    # поэтому в реальных приложениях такие вещи надо выносить в background задачи!
    all_emails.each do |mail|
      EventMailer.comment(event, comment, mail).deliver_later
    end
  end
end
