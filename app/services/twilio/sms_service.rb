module Twilio
  class SmsService
    TWILIO_ACCCOUNT_SID = 'AC91cff2ca55b0d86b3568414f81f9cad1'
    TWILIO_AUTH_TOKEN = '4b2cb9836b1ed91ee1fd6753057f0ce6'
    TWILIO_FROM_PHONE = '+12512782792'
    TWILIO_TO_PHONE = '+92 301 5048867'
   
    def initialize(body:, to_phone_number:)
      @body = body
      @to_phone_number = to_phone_number
    end

    def call
      @client = Twilio::REST::Client.new TWILIO_ACCCOUNT_SID, TWILIO_AUTH_TOKEN
      message = @client.messages.create(
        body: @body,
        to: to(@to_phone_number),  # Text this number
        from: TWILIO_FROM_PHONE, # From a valid Twilio number
      )

      puts message.sid
    end

    private

    def to(to_phone_number)
      return TWILIO_TO_PHONE if Rails.env.development?

      to_phone_number
    end
  end
end
