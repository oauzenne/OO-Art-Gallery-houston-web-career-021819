class Gallery

  attr_reader :name, :city

  @@all = []

  def initialize(name, city)
    @name = name
    @city = city
    @@all << self
  end

  def self.all
    @@all
  end

  def paintings
    Painting.all.select do | painting |
      painting.gallery == self
    end
  end

  def artists
    gallery_paintings = self.paintings
    gallery_paintings.map do | painting |
      painting.artist
    end
  end

  def artist_names
    self.artists.map do | artist |
      artist.name
    end
  end

  def most_expensive_painting
    gallery_paintings = self.paintings
    highest_price = 0
    most_expensive_painting = nil
    gallery_paintings.each do | painting |
      if painting.price > highest_price
        highest_price = painting.price
        most_expensive_painting = painting
      end
    end
    return most_expensive_painting
  end


end
