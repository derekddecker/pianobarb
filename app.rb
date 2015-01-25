require 'sinatra'
require 'sinatra/reloader'

class PiControl < Sinatra::Base

  register Sinatra::Reloader

  PIANO_ROOT = '/home/derek/.config/pianobar'
  PIANOBAR_CTL = "#{PIANO_ROOT}/ctl"
  PIANOBAR_STATIONLIST = "#{PIANO_ROOT}/stationlist"

  post "/pianobar/changest" do
    result = nil
    stationlist = File.open(PIANOBAR_STATIONLIST)
    stationlist.each_line do |line|
      if(Regexp.new("#{params[:station]}", Regexp::IGNORECASE).match(line))
	LOGGER.debug "MATCHED! #{line}"
        result = /^[0-9]+/.match(line)[0]
      end
    end
    if(!result.nil?)
      `echo 's#{result}' > #{PIANOBAR_CTL}`
    end
    LOGGER.debug "Changing station to: #{params[:station]} - #{result}"
  end

end 
