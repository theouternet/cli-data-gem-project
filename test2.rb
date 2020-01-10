require 'nokogiri'
require 'open-uri'
require 'pry'
 
 def get_page
 doc = Nokogiri::HTML(open("https://www.imdb.com/showtimes/location/US/75201?sort=user_rating,desc"))
 
moviez = []
  
  doc.css("div.lister-item").each do |m|
    
    deets = {}
    
      deets[:title] = m.css("div.title a").text
      deets[:score] = m.css("div#user_rating strong").text
      deets[:profile_url] = m.css("div.title a").attribute("href").value
    
    moviez << deets
    
  end 
  moviez
  end
  

  
  
 puts get_page