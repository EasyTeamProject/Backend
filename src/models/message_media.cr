class MessageMedia < Granite::Base


  adapter pg
  table_name message_media

  belongs_to :message

  primary id : Int64
  field storage : String
  timestamps
end
