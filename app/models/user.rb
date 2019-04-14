require 'twilio-ruby'
class User < ApplicationRecord
  has_secure_password
  has_many :projects
  has_many :reminders,  as: :imageable
  # validates :username, uniqueness: { case_sensitive: false }
  validates :email, uniqueness: { case_sensitive: false }
  validates :number, uniqueness: true
  def sendText(reminder)
    number = "#{self[:number]}".chomp('.0')

    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_TOKEN"]
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+12015089138'
    to = "#{number}"

    client.messages.create(
    from: from,
    to: to,
    body: "#{reminder.title}:/n #{reminder.description}"
    )
  end
end
