module Events
  class MediasController < ApplicationController
    def index
      medias = EventMedia.where(event_id: params["event_id"]).select

      respond_with do
        json EventMediaSerializer.render(medias.to_a)
      end
    end

    def create
      image = params.files["image"]

      # Store file inside disk
      uploader = Uploader.new
      storage = uploader.upload(image.file)

      media = EventMedia.new(
        storage: storage,
        event_id: params[:event_id],
        user_id: context.current_user_id
      )

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
