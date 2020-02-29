# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require_relative 'lib/best_movies_near_me/version'

Gem::Specification.new do |s|
  s.name        = 'best-movies-near-me'
  s.version     = BestMoviesNearMe::VERSION
  s.date        = '2020-01-06'
  s.summary     = "Best Movies Near Me"
  s.description = "Lists Movies That Are Actually Good, Actually Playing Near Me"
  s.authors     = ["theouternet"]
  s.email       = 'steveholt04@gmail.com'
  s.files       = ["lib/best_movies_near_me.rb", "lib/best_movies_near_me/cli.rb", "lib/best_movies_near_me/scraper.rb", "lib/best_movies_near_me/movie.rb", "config/environment.rb"]
  s.homepage    = 'https://github.com/theouternet/cli-data-gem-project'
  s.license     = 'MIT'
  s.executables << 'best-movies-near-me'

  s.add_development_dependency "bundler", "~> 2.0.1"
  s.add_development_dependency "rake", "~> 12.3"
  s.add_development_dependency "rspec", ">= 0"
  s.add_development_dependency "nokogiri", ">= 0"
  s.add_development_dependency "pry", ">= 0"
end