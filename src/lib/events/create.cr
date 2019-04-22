module Events
  class Create
    def initialize(@strategy : Times::ParseStrategy)
    end

    def call(name : String, date : String) : Event
      Event.new name: name, date: @strategy.call(date)
    end
  end
end
