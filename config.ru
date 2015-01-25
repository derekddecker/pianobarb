require 'logger'
require ::File.expand_path('../app.rb', __FILE__)

configure do
  LOGGER = Logger.new("log/server.log")
  enable :logging, :dump_errors
  set :raise_errors, true
end

run PiControl
