require "habitat"

class Uploader
  Habitat.create do
    setting upload_strategy : UploadStrategy
  end

  def upload(content)
    settings.upload_strategy.upload(content)
  end
end
