class BestMoviesNearMe::CLI 
  
  def call 
    
    puts ""
    puts "Welcome to GoodMovieFinder, where we cut out the bullshit and fake reviews to find *actual* quality movies *actually* playing near you. Please stand by..."
    
        BestMoviesNearMe::Scraper.new.create_movie

    start 
    
  end 
  
  def start 
    puts ""
    puts "What caliber of movie would you like to see? Excellent, Good, So-So, or Shitty?"
    input = gets.strip.capitalize 
    
    print_movies(input)
    
    puts ""
    puts "Which movie would you like more info on? Type in its number:"
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
    puts "Metascore: #{movie.metascoree}"
    puts ""
    puts "Showtimes: #{movie.showtimes}"
    puts ""
  end
  
    def print_movies(caliber)
     
      if BestMoviesNearMe::Movie.all.find {|m| m.quality == caliber}
     
      puts ""
      puts "---- #{caliber} movies ----"
      puts ""
      BestMoviesNearMe::Movie.all.each_with_index do |m, i|
      if m.quality == caliber
      puts "#{i+1}. #{m.title} - Metascore: #{m.metascoree}"
    end
  end 
  
    else
    puts ""
    puts "No movies in that category are showing near you."
    puts ""
    start
  end
  
  end

end 