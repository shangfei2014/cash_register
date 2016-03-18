class Item
  def initialize(name, unit, price_per_unit, count, discount)
    @name = name
    @unit = unit
    @price_per_unit = price_per_unit
    @count = count
    @discount = discount
  end

  def price
    if @discount.empty?
      total = no_discount
    elsif @discount == 'buy_2_free_1'
      total = buy_2_free_1
    elsif @discount == 'off_percent_5'
      total = off_percent_5
    end
    total.round(2)
  end

  def buy_2_free_1
    if @count / 3 <= 0
      return no_discount
    end
    (@count - @count / 3) * @price_per_unit
  end

  def no_discount
    @price_per_unit * @count
  end

  def off_percent_5
    @price_per_unit * @count * 0.95
  end
end
