class BestMoviesNearMe::Movie
  
  attr_accessor :title, :metascore
  
  @@all = [] 
  
  def self.new_from_index_page(m)
    self.new(
      m.css("h1.header").text,
      m.css("span.metascore").text
      )
    end
  
  def initialize(title=nil, metascore=nil)
    @title = title
    @metascore = metascore
    
    @@all << self
  end
  
end