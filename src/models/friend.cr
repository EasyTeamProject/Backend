class Friend < Granite::Base
  adapter pg
  table_name friends

  belongs_to from : User
  belongs_to to : User

  primary id : Int64
  timestamps
end
