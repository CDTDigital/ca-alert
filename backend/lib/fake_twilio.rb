class FakeTwilio
  Message = Struct.new(:from, :to, :body)

  cattr_accessor :messages
  self.messages = []

  def initialize(_account_sid = nil, _auth_token = nil); end

  def messages
    self
  end

  def create(from:, to:, body:)
    self.class.messages << Message.new(from, to, body)
    Rails.logger.info("Sending Fake Twilio Message to: #{to}, from: #{from}, body: #{body}")
  end
end
