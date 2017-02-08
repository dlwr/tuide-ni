class ProfileWorker
  include Sidekiq::Worker

  sidekiq_options retry: 5, unique: :until_executed

  def perform(line_id)
    LineProfileFetcher.fetch(line_id)
  end
end
