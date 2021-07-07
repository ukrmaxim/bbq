class EventMailerJob < ApplicationJob
  queue_as :mailer

  def perform(*options)
    case options[1]
    when Comment
      all_emails = options[0].subscriptions.map(&:user_email) + [options[0].user.email] - [options[1].user.email]

      all_emails.each do |mail|
        EventMailer.comment(options[0], options[1], mail).deliver_later
      end
    when Photo
      all_emails = options[0].subscriptions.map(&:user_email) + [options[0].user.email] - [options[1].user.email]

      all_emails.each do |mail|
        EventMailer.photo(options[0], options[1], mail).deliver_later
      end
    when Subscription
      EventMailer.subscription(options[0], options[1]).deliver_later
    end
  end
end
