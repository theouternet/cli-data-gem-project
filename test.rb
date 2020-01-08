 require 'nokogiri'
require 'open-uri'
require 'pry'

class Yeah
 
 def get_page
 doc = Nokogiri::HTML(open("https://www.imdb.com/showtimes/location?ref_=sh_lc&sort=user_rating,desc"))
 
 listing = doc.css("div.lister-item-image.ribbonize")
 
 
 
  binding.pry
  end 
  
 
  def get_movies
    self.get_page.css("div.lister-item.mode-grid")
  end
  

  def printer 
    
    puts get_movies.css("div.title a").attribute("href").text
      get_movies.css("span./^metascore/").text.to_i
      get_movies.css("p.").text
      get_movies.css("div.title a").attribute("href").value
      
    end
    
  end
  
  Yeah.new.get_page