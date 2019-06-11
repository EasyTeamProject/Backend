require "crinder"

class AlbumSerializer < Crinder::Base(Album)
  field id! : Int64, as: id

  field name! : String, as: name

  field images : Array(String), value: images

  field created_at : String
  field updated_at : String

  def self.images
    object.album_medias.map(&.storage!)
  end
end
