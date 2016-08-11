class MyWorker
  include Sidekiq::Worker

  def perform(id)
    object = Model.find(id)
    object.generate_download
    UserMailer.download_is_ready(object).deliver
  end
end
