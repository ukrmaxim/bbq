class EventMailerJob < ApplicationJob
  queue_as :mailer

  def perform(record)
    event = record.event

    case record
    when Comment
      all_emails = event.subscriptions.map(&:user_email) + [event.user.email] - [record.user&.email]
      all_emails.each do |mail|
        EventMailer.comment(event, record, mail).deliver_later
      end
    when Photo
      all_emails = event.subscriptions.map(&:user_email) + [event.user.email] - [record.user&.email]

      all_emails.each do |mail|
        EventMailer.photo(event, record, mail).deliver_later
      end
    when Subscription
      EventMailer.subscription(event, record).deliver_later
    end
  end
end
