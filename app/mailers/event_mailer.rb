class EventMailer < ApplicationMailer
  # Письмо о новой подписке для автора события
  def subscription(event, subscription)
    @email = subscription.user_email
    @name = subscription.user_name
    @event = event

    mail to: event.user.email, subject: default_i18n_subject(title: event.title)
  end

  # Письмо о новом комментарии на заданный email
  def comment(event, comment, email)
    @comment = comment
    @event = event

    mail to: email, subject: default_i18n_subject(title: event.title)
  end

  def photo(event, photo, email)
    @event = event
    @photo = photo

    if Rails.env.production?
      attachments.inline['image.jpg'] = File.read(Down.download(photo.image.thumb))
    else
      attachments.inline['image.jpg'] = File.read("public#{photo.image.thumb}")
    end

    mail to: email, subject: default_i18n_subject(title: event.title)
  end
end
