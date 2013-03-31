require 'open-uri'
require 'nokogiri'

def memrise2Anki url
	doc = Nokogiri::HTML(open(url))
	episodeCount = doc.css(".level-title").count

	cards = {}
	1.upto(episodeCount) do |i|
		levelUrl = url + i.to_s + "/"
		puts "Checking level #{i}"
		cards = cards.merge(getLevelWordList levelUrl)
	end
	
	ankiList = ""
	cards.each { |clue, answer| ankiList << "#{clue}:#{answer}\n" }
	return ankiList
end

def getLevelWordList url
	doc = Nokogiri::HTML(open(url))
	clues = doc.css(".text-text .col_a .text").map { |clue| clue.content }
	answers = doc.css(".text-text .col_b .text").map { |answer| answer.content }
	return Hash[clues.zip(answers)]
end
