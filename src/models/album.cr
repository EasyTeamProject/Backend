class Album < Granite::Base
  include ModelGranite

  adapter pg
  table_name albums

  belongs_to :event

  has_many album_medias : AlbumMedia

  primary id : Int64
  field name : String
  timestamps
end
