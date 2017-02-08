module MessageParser
  class << self
    def parse(request)
      # return false unless signature_valid?(request)
      messages = JSON.parse(request.body.read, symbolize_names: true)
      p messages
      messages[:events].each do |event|
        if event[:type] == 'follow'
          if line_id = event[:source][:userId]
            User.find_or_create_by(line_id: line_id)
          end
          return
        elsif event[:type] != 'message' || event[:message][:type] != 'text'
          return
        end
        text = event[:message][:text]
        p text
        line_id = event[:source][:userId]
        last_offer = Offer.order(id: :desc).first
        mention = Mention.new(text: text, user: User.find_or_create_by(line_id: line_id), offer: last_offer)
        mention.save
      end
    end

    def signature_valid?(request)
      secret = Rails.application.secrets.line['channel_secret']
      body = request.raw_post
      hash = OpenSSL::HMAC::digest(OpenSSL::Digest::SHA256.new, secret, body)
      signature = Base64.strict_encode64(hash)
      puts signature
      puts request.headers['X-LINE-ChannelSignature']
      request.headers['X-LINE-ChannelSignature'] == signature
    end
  end
end
