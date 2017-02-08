require 'line/bot'

module LineProfileFetcher
  class << self
    def fetch(line_id)
      raise ArgumentError, 'line_id is empty' unless line_id
      response = client.get_profile(line_id)
      case response
      when Net::HTTPSuccess then
        contact = JSON.parse(response.body)
        user = User.find_by(line_id: line_id)
        user.update!(
          display_name: contact['displayName'],
          picture_url: contact['pictureUrl']
        )
      else
        p "#{response.code} #{response.body}"
      end
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
