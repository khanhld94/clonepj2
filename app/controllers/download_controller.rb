class DownloadController < ApplicationController
  def generate
    object = Model.find(param[:id])
    # instead of calling object.generate_download we'll do:
    MyWorker.perform_async(object.id)
  end
end
