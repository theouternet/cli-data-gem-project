class BestMoviesNearMe::Scraper 
  
  def get_page
    Nokogiri::HTML(open("https://www.imdb.com/showtimes/location?ref_=sh_lc&sort=user_rating,desc"))
  end 
  
  def scrape_movie_listings
    self.get_page.css("div.lister-item-image ribbonize a").attribute("href").value
    end
    
    def create_movie
      scrape_movie_listings.each do |m|
        BestMoviesNearMe::Moive.new_from_index_page(m)
      end 
    end 
  end