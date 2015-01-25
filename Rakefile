require 'rakeup'

RakeUp::ServerTask.new do |t|
  t.port = 9296
  t.host = "192.168.1.67"
  t.pid_file = 'tmp/server.pid'
  t.rackup_file = 'config.ru'
  t.server = :webrick

  t.stop_command = "sudo kill -9 `cat #{t.pid_file}`"
end
