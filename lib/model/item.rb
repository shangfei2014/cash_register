class Item

  attr_accessor :name, :unit, :price_per_unit, :discount

  def initialize(name, unit, price_per_unit, discount)
    @name = name
    @unit = unit
    @price_per_unit = price_per_unit
    @discount = discount
  end

end