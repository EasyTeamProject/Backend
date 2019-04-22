module Times
  module Parse
    # Support 
    # => 2016-04-05
    class ISO8601Date < ParseStrategy
      def call(date : String) : Time
        # ::Time.parse(date, Time::Format::ISO_8601_DATE, Time::Location::UTC)
        Time.parse(date, "%F", Time::Location::UTC)
      end
    end
  end
end
