class Item
  attr_accessor :name, :unit, :price_per_unit, :count, :discount

  def initialize(name, unit, price_per_unit, count, discount)
    @name = name
    @unit = unit
    @price_per_unit = price_per_unit
    @count = count
    @discount = discount
  end

  def calculate_result
    if @discount.empty?
      result = no_discount
    elsif @discount == 'buy_2_free_1'
      result = buy_2_free_1
    elsif @discount == 'off_percent_5'
      result = off_percent_5
    end
    result
  end

  private

  def buy_2_free_1
    if @count / 3 <= 0
      return no_discount
    end
    saved_count = @count / 3
    saved_price = saved_count * @price_per_unit
    total = (@count - saved_count) * @price_per_unit
    { total: format_price(total), saved_price: format_price(saved_price), saved_count: saved_count }
  end

  def no_discount
    { total: format_price(@price_per_unit * @count), saved_price: '0.00', saved_count: 0 }
  end

  def off_percent_5
    origin = @price_per_unit * @count
    total = origin * 0.95
    saved_price = origin - total
    { total: format_price(total), saved_price: format_price(saved_price), saved_count: 0 }
  end

  def format_price(price)
    '%.2f' % price
  end
end
