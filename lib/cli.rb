class BestMoviesNearMe::CLI 
  
  def call 
    BestMoviesNearMe::Scraper.new.create_movie
    puts "Welcome to GoodMovieFinder, where we cut out the bullshit and fake reviews to find *actual* quality movies *actually* playing near you."
    start 
  end 
  
  def start 
    puts ""
    puts "What caliber of movie would you like to see? Excellent, Good, So-So, Not Good, or Shitty?"
    input = gets.strip.downcase 
    
    print_movies(input)
    
    puts ""
    puts "Which movie would you like more info on?"
    input = gets.strip
  
  movie = BestMoviesNearMe::Movie.find(input.to_i)
  
  print_movie(movie)
  
  puts ""
  puts "Want to see another movie? Enter Y or N"
  
  input = gets.strip.downcase
  if input == "y"
    start 
    elsif input == "n"
    puts ""
    puts "See Ya"
    exit
  else 
    puts ""
    puts "Invalid answer."
    start 
  end 
  end 
  
  
  
  
end 