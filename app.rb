require 'sinatra'
load 'converter.rb'

get '/' do
	"Hello world! The time is #{Time.now} where I'm at."
end

get '/bonjour/:courseurl' do
	courseUrl = URI.unescape(params[:courseurl])
	return memrise2Anki courseUrl
end
