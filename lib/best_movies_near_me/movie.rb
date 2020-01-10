class BestMoviesNearMe::Movie
  
  attr_accessor :title, :metascore, :synopsis, :showtimes, :quality
  
  @@all = [] 
  
  def self.new_from_index_page(m)
    self.new(
      m.css("div.title a").text,
      m.css("div#user_rating strong").text
      m.css("div.title a").attribute("href").value
      nil
      )
    end
  
  def initialize(title=nil, rating=nil, detail_page=nil, quality=nil)
    @title = title
    @rating = rating.to_i
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
    
  def doc 
    @doc ||= Nokogiri::HTML(open(self.url))
  end
  
end