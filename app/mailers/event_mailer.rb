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

  def photo(event, photo, email)
    @event = event
    @photo = photo

    if Rails.env.production?
      attachments.inline['image.jpg'] = File.read(Down.download("#{photo.image}"))
    else
      attachments.inline['image.jpg'] = File.read("public#{photo.image}")
    end

    mail to: email, subject: t('event_mailer.photo.subject')+"#{event.title}"
  end
end
