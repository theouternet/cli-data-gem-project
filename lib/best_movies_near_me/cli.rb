class BestMoviesNearMe::CLI 
  
  def call 
    BestMoviesNearMe::Scraper.new.create_movie
    puts "Welcome to GoodMovieFinder, where we cut out the bullshit and fake reviews to find *actual* quality movies *actually* playing near you."
    start 
  end 
  
  def start 
    puts ""
    puts "What caliber of movie would you like to see? Excellent, Good, So-So, or Shitty?"
    input = gets.strip.capitalize 
    
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
  
  def print_movie(movie)
    puts ""
    puts "Title: #{movie.title}"
    puts ""
    puts "Synopsis: #{movie.synopsis}"
    puts ""
    puts "Metascore: #{movie.metascore}"
    puts ""
    puts "Showtimes: #{movie.showtimes}"
    puts ""
  end
  
    def print_movies(caliber)
      puts ""
      puts "---- #{caliber} movies ----"
      puts ""
      
      caliber_array = BestMoviesNearMe::Movie.all.select {|m| m['quality'] == caliber }
      caliber_array.each_with_index do |movie, index|
        puts "#{index+1}). #{movie.title} - #{movie.metascore}"
      end
    end

end 