require 'sinatra'
load 'converter.rb'

get '/bonjour/:courseurl' do
	courseUrl = URI.unescape(params[:courseurl])
	return memrise2Anki courseUrl
end
