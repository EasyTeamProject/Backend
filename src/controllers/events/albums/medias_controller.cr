module Events
  module Albums
    class MediasController < ApplicationController
      def create
        image = params.files["image"]

        # Store file inside disk
        uploader = Uploader.new
        storage = uploader.upload(image.file)

        media = AlbumMedia.new(storage: storage, album_id: params[:album_id])

        if media.save
          respond_with do
            json media.to_json
          end
        else
          respond_with(400) do
            json({ "error" => "Cannot create the media" })
          end
        end
      end
    end
  end
end
