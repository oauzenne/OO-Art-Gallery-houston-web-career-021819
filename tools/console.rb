require_relative '../config/environment.rb'

bob = Artist.new("Bob", 14)
sally = Artist.new("Sally", 21)

blue = Painting.new("Blue", 50)
green = Painting.new("Green", 75)
pink = Painting.new("Pink", 30)

art_museum = Gallery.new("Art Musuem","Houston")
car_museum = Gallery.new("Car Museum", "Los Angeles")


blue.artist = bob
blue.gallery = art_museum
green.artist = bob

pink.artist = sally
pink.gallery = art_museum

binding.pry

puts "Bob Ross rules."
