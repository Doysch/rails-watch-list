require 'open-uri'
require 'json'

puts 'Cleaning up database...'
Movie.destroy_all
puts 'Database cleaned'

url = 'http://tmdb.lewagon.com/movie/top_rated'

puts 'Importing movies'
movies = JSON.parse(URI.open("#{url}?page=1").read)['results']
movies.each do |movie|
  base_poster_url = 'https://image.tmdb.org/t/p/original'
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "#{base_poster_url}#{movie['backdrop_path']}",
    rating: movie['vote_average']
  )
  puts 'Movies created'
end
