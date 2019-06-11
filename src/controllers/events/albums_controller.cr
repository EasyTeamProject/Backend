module Events
  class AlbumsController < ApplicationController
    def index
      albums = Album.all

      respond_with do
        json AlbumSerializer.render(albums.to_a)
      end
    end

    def create
      album = Album.new(
        event_id: params[:event_id],
        name: params[:name]
      )

      if album.save
        respond_with do
          json AlbumSerializer.render(album)
        end
      else
        respond_with(400) do
          json({ "error" => "Cannot create the album" })
        end
      end
    end
  end
end
