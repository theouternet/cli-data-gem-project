class BestMoviesNearMe::Movie
  
  attr_accessor :title, :rating, :detail_page, :showtimes, :quality, :synopsis, :metascore
  
  @@all = [] 
  
  def self.new_from_index_page(m)
    self.new(
      m.css("div.title a").text,
      m.css("div#user_rating strong").text.to_i,
      "https://www.imdb.com#{m.css("div.title a").attribute("href").text}",
      nil
      )
    end
  
  def initialize(title=nil, rating=nil, detail_page=nil, quality=nil)
    @title = title
    @rating = rating
    @detail_page = detail_page
    @quality = quality
    
    qual_sorter
    
    @@all << self
  end
  
  def qual_sorter
    if @rating >= 9
    @quality = "Excellent"
    elsif @rating.between?(8,8.9)
    @quality = "Good"
    elsif @rating.between?(7,7.9)
    @quality = "So-So"
    elsif @rating < 7
    @quality = "Shitty"
  else 
    "No Metascore Available"
  end
  end
  
  def self.all
    @@all
  end
  
  def self.find(id)
    self.all[id-1]
  end
    
  def doc 
    @doc ||= Nokogiri::HTML(open(self.detail_page))
  end
  
  def metascore
    @metascore ||= doc.css("span.metascore").text.to_i
  end
  
  def synopsis
    @synopsis ||= doc.css("div.outline").text
  end
  
  def showtimes
    @showtimes ||= doc.css("div.list.detail").text
  end
 
  
end