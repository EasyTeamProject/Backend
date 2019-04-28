module Times
  abstract class ParseStrategy
    abstract def call(date : String) : Time
  end
end
