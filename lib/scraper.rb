class BestMoviesNearMe::Scraper 
  
  def get_page
    Nokogiri::HTML(open("https://www.imdb.com/showtimes/location?ref_=sh_lc&sort=user_rating,desc"))
  end 
  
  def scrape_movie_listings
    self.get_page.css("")
  end