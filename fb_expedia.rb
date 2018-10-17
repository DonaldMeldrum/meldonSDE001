require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'

begin
	url = 'https://www.facebook.com/expedia/posts/'
	numPosts = 8
	page = Nokogiri::HTML(open(url))
	postElements = page.xpath("//div[@class='_5pbx userContent _3576']/p").first(numPosts).select{|p| p != nil}
	postArray = []
	postElements.each{|post| 
		timeStamp = post.parent.parent.css('abbr')[0].attribute('title')
		postHash = {:postText => post.text, :timeStamp => timeStamp }
		postArray << postHash
	}
	fileTime = Time.now.strftime("%Y%m%d%H%M%S") 
	fileName = 'fb-expedia-posts_' + fileTime + '.json'
	output = File.open( fileName,'w' )
	output.write(postArray.to_json)
	output.close
	puts 'Saved last ' + numPosts.to_s + ' post(s) from ' + url + ' to ' + Dir.pwd + '/' + fileName
rescue => e
	puts 'Error encountered:'
	puts e.message
end