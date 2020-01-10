class BestMoviesNearMe::Movie
  
  attr_accessor :title, :rating, :detail_page, :showtimes, :quality, :synopsis, :metascore
  
  @@all = [] 
  
  def self.new_from_index_page(m)
    self.new(
      m.css("div.title a").text,
      m.css("div#user_rating strong").text.to_i,
      m.css("div.title a").attribute("href").value,
      nil)
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
    
  def doc 
    @doc ||= Nokogiri::HTML(open(self.detail_page))
  end
  
  def detail_page_attrs
    @metascore = doc.css("span.metascore").text.to_i 
    @synopsis = doc.css("div.outline").text 
    @showtimes = doc.css("div.list.detail")
  end 
  
end