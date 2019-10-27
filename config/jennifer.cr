require "jennifer"
require "jennifer/adapter/postgres"

require "colorize"

Jennifer::Config.read("config/database.yml", Amber.env.to_s)

Jennifer::Config.configure do |conf|
  conf.logger = Logger.new(STDOUT)

  conf.logger.formatter = Logger::Formatter.new do |severity, datetime, progname, message, io|
    io << datetime.colorize(:cyan) << ": \n" << message.colorize(:light_magenta)
  end
  conf.logger.level = Logger::DEBUG
end
