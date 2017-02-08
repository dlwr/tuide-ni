class Offer < ActiveRecord::Base
  has_many :mentions, inverse_of: :offer
end
