class Item
  attr_accessor :name, :price

  @@all = []  #added

  def initialize(name,price)
    @name = name
    @price = price
    @@all << self  #added
  end

  def self.all  #added
    @@all
  end

end
