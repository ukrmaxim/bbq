class EventMailerJob < ApplicationJob
  queue_as :mailer

  def perform(record)
    case record
    when Comment
      all_emails(record).each do |mail|
        EventMailer.comment(record, mail).deliver_later
      end
    when Photo
      all_emails(record).each do |mail|
        EventMailer.photo(record, mail).deliver_later
      end
    when Subscription
      EventMailer.subscription(record).deliver_later
    end
  end

  private

  def all_emails(record)
    event = record.event

    event.subscriptions.map(&:user_email) + [event.user.email] - [record.user&.email]
  end
end
