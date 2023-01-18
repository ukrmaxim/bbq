class EventMailer < ApplicationMailer
  def subscription(subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = subscription.event

    mail to: @event.user.email, subject: default_i18n_subject(title: @event.title)
  end

  def comment(comment, email)
    @comment = comment
    @event = comment.event

    mail to: email, subject: default_i18n_subject(title: @event.title)
  end

  def photo(photo, email)
    @photo = photo
    @event = photo.event

    attachments.inline['image.jpg'] = if Rails.env.production?
                                        File.read(Down.download(photo.image.thumb))
                                      else
                                        File.read("public#{photo.image.thumb}")
                                      end

    mail to: email, subject: default_i18n_subject(title: @event.title)
  end
end
