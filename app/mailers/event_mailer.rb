class EventMailer < ApplicationMailer
  # Письмо о новой подписке для автора события
  def subscription(event, subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = event

    mail to: event.user.email, subject: t('event_mailer.subscription.subject')+"#{event.title}"
  end

  # Письмо о новом комментарии на заданный email
  def comment(event, comment, email)
    @comment = comment
    @event = event

    mail to: email, subject: t('event_mailer.comment.subject')+"#{event.title}"
  end
end
