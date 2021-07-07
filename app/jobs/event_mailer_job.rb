class EventMailerJob < ApplicationJob
  queue_as :mailer

  def perform(event, options = {})
    case options
    when Comment
    if options.user.present?
        all_emails = event.subscriptions.map(&:user_email) + [event.user.email] - [options.user.email]
      else
        all_emails = event.subscriptions.map(&:user_email) + [event.user.email]
      end

      all_emails.each do |mail|
        EventMailer.comment(event, options, mail).deliver_now
      end
    when Photo
      all_emails = event.subscriptions.map(&:user_email) + [event.user.email] - [options.user.email]

      all_emails.each do |mail|
        EventMailer.photo(event, options, mail).deliver_now
      end
    when Subscription
      EventMailer.subscription(event, options).deliver_now
    end
  end
end
