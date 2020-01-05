class BestMoviesNearMe::Movie
  
  attr_accessor :title, :metascore, :synopsis, :showtimes, :quality
  
  @@all = [] 
  
  def self.new_from_index_page(m)
    self.new(
      m.css("h1.header").text,
      m.css("span.metascore").text.to_i,
      m.css("div.outline").text,
      m.css("div.list detail").text
      )
    end
  
  def initialize(title=nil, metascore=nil, synopsis=nil, showtimes=nil, quality=nil)
    @title = title
    @metascore = metascore.to_i
    @synopsis = synopsis
    @showtimes = showtimes
    @quality = quality
    qual_sorter
    @@all << self
  end
  
  def qual_sorter
    if @metascore >= 86
    @quality = "Excellent"
    elsif @metascore.between?(70,85)
    @quality = "Good"
    elsif @metascore.between?(55,69)
    @quality = "So-So"
    elsif @metascore < 55
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