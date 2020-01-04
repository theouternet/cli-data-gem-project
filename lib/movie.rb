class BestMoviesNearMe::Movie
  
  attr_accessor :title, :metascore, :synopsis, :showtimes
  
  @@all = [] 
  
  def self.new_from_index_page(m)
    self.new(
      m.css("h1.header").text,
      m.css("span.metascore").text,
      m.css("div.outline").text,
      m.css("div.list detail").text
      )
    end
  
  def initialize(title=nil, metascore=nil, synopsis=nil, showtimes=nil)
    @title = title
    @metascore = metascore
    @synopsis = synopsis
    @showtimes = showtimes
    
    @@all << self
  end
  
end