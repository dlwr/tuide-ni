class User < ActiveRecord::Base
  has_many :articles, inverse_of: :user

  after_create {
    ProfileWorker.perform_async(self.line_id)
  }
end
