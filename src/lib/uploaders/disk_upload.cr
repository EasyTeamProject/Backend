require "random/secure"
require "./upload_strategy"

class DiskUpload < UploadStrategy
  def initialize(@storage_path : String)
  end

  def upload(content)
    random = Random::Secure.hex
    ext = File.extname(content.path)
    path = "#{@storage_path}/#{random}#{ext}"

    File.write("./public/#{path}", content)

    path
  end
end
