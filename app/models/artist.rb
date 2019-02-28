class Artist

  attr_reader :name, :years_experience
  attr_writer :years_experience

  @@all = []

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def self.total_experience
    sum = 0
    @@all.inject(0) do  | sum, artist |
      sum + artist.years_experience
    end
  end

  def paintings
    Painting.all.select do | painting |
      painting.artist == self
    end
  end

  def galleries
    artist_paintings = self.paintings
    artist_paintings.map do | painting |
      painting.gallery
    end
  end

  def cities
    artist_galleries = self.galleries
    artist_galleries.map do | gallery |
      gallery.city
    end
  end

  def create_painting(title,price, gallery)
    new_painting = Painting.new(title, price)
    new_painting.gallery = gallery
    new_painting
  end

  def self.most_prolific
    highest_productivity_rate = 0

    self.all.each do | artist |
      average_productivity_each_artist = artist.paintings.size / artist.years_experience
      if average_productivity_each_artist >  highest_productivity_rate
        highest_productivity_rate = average_productivity_each_artist
      end
    end
    self.all.find do |artist|
      artist.paintings.size/artist.years_experience == highest_productivity_rate
    end
  end


end
