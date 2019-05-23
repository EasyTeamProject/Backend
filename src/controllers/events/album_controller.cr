class Events::AlbumController < ApplicationController
  def index
    albums = Album.where(event_id: album_params[:event_id])

    respond_with do
      json albums.to_json
    end
  end

  def create
    album = Album.new(
      event_id: album_params[:event_id],
      name: album_params[:name]
    )

    if album.save
      respond_with do
        json album.to_json
      end
    else
      respond_with do
        json({error: "An error"}.to_json)
      end
    end
  end

  private def album_params
    params.validation do
      required(:event_id)
      required(:name)
    end
  end
end
