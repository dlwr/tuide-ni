require 'line/bot'

module OfferCreator
  class << self
    def create
      p 'multicast'
      response = client.multicast(User.pluck(:line_id), [
          {
            "type": "text",
            "text": '今から大規模実験装置で実験するけど、なにかついでにやっておきましょうか？'
          }
        ])
      Offer.create()
    end

    private

    def client
      @client ||= Line::Bot::Client.new {|config|
        config.channel_secret = Rails.application.secrets.line['channel_secret']
        config.channel_token = Rails.application.secrets.line['channel_access_token']
      }
    end
  end
end
