require 'json'
require 'open-uri'

url = 'https://tmdb.lewagon.com/movie/top_rated'
object_serialized = URI.open(url).read
object = JSON.parse(object_serialized)
movies = object['results']

movies.each do |program|
  title = program['title']
  overview = program['overview']
  rating = program['vote_average']
  poster_url = "https://image.tmdb.org/t/p/w500#{program['poster_path']}"
  Movie.create(title: title, overview: overview, rating: rating, poster_url: poster_url)
end
