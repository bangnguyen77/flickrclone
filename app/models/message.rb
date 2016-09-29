class Message < ApplicationRecord
  before_create :send_sms

  private

  def send_sms
    begin
        response = RestClient::Request.new(
        :method => :post,
        :url => "https://api.twilio.com/2010-04-01/Accounts/AC4ffb8860f246dbe738b82fc79fd8fa8f/Messages.json",
        :user => 'AC4ffb8860f246dbe738b82fc79fd8fa8f',
        :password => 'db55ddb0f6aca9a92a76913d8f17476b',
        :payload => { :Body => body,
                      :MediaUrl => 'https://www.allaboutbirds.org/guide/bbimages/aab/images/blue-winged-warbler.jpg',
                      :From => "5032726497",
                      :To => to }
        ).execute
    rescue RestClient::BadRequest => error
      message = JSON.parse(error.response)['message']
      errors.add(:base, message)
      throw(:abort)
    end
  end
end
