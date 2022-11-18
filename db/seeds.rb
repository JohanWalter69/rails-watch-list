# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require 'open-uri'
require 'json'

puts 'Cleaning database...'
Movie.destroy_all

# 25.times do
#   movie = Movie.create(title: Faker::Movie.title,
#                         overview: Faker::Movie.quote,
#                         poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
#                         rating: rand(0..10))
#                         puts "#{movie.title}"
# end


Movie.destroy_all
api_url = 'https://tmdb.lewagon.com/movie/top_rated'
top_rated = JSON.parse(URI.open(api_url).read)['results']

top_rated.each do |movie|
  Movie.create(
    title: movie['title'], overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/original/#{movie['poster_path']}",
    rating: movie['vote_average']
  )
  puts "#{movie.title}"
end
