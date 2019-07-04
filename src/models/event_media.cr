class EventMedia < Granite::Base
  adapter pg
  table_name event_media

  belongs_to :event

  belongs_to :user

  primary id : Int64
  field storage : String
  timestamps
end
