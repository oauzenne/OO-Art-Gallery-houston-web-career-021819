class Painting
  attr_accessor :artist, :gallery
  attr_reader :title, :price

  @@all = []

  def initialize(title, price)
    @title = title
    @price = price
    @@all << self
  end

  def self.all
    @@all
  end

  def self.total_price
    sum = 0
    @@all.inject(0) do  | sum, painting |
      sum + self.price
    end
  end

end
