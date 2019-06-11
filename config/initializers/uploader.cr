if Amber.env.development?
  Uploader.configure do |settings|
    settings.upload_strategy = DiskUpload.new("pictures")
  end
else
  Uploader.configure do |settings|
    settings.upload_strategy = AmazonUpload.new
  end
end
