require 'nokogiri'
require 'open-uri'
require 'pry'

class Yeah
 
 def get_page
 doc = Nokogiri::HTML(open("https://www.imdb.com/showtimes/location/US/75201?sort=user_rating,desc"))
 
 listing = doc.css("div.smart-popout")
 
  binding.pry
  end 
  
 
  def get_movies
    self.get_page.css("div.lister-item.mode-grid")
  end
  

  def printer 
    
    puts get_movies.css("div.title a").text
      get_movies.css("div.ratings-metascore span").text.sub(" ","")
      #sub out spaces? DO NOT USE .to_i
      
      get_movies.css("p.").text
      get_movies.css("div.title a").attribute("href").value
      
    end
    
  end
  
  Yeah.new.get_page