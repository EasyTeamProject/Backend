class AlbumMedia < Granite::Base
  adapter pg
  table_name album_media

  belongs_to :album

  belongs_to :user

  primary id : Int64
  field storage : String
  timestamps
end
