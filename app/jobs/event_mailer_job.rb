class EventMailerJob < ApplicationJob
  queue_as :mailer

  def perform(record)
    case record
    when Comment
      all_emails = record.event.subscriptions.map(&:user_email) + [record.event.user.email] - [record.user&.email]
      all_emails.each do |mail|
        EventMailer.comment(record.event, record, mail).deliver_later
      end
    when Photo
      all_emails = record.event.subscriptions.map(&:user_email) + [record.event.user.email] - [record.user&.email]

      all_emails.each do |mail|
        EventMailer.photo(record.event, record, mail).deliver_later
      end
    when Subscription
      EventMailer.subscription(record.event, record).deliver_later
    end
  end
end
