class ItemLine
  attr_accessor :item, :count

  def initialize(item, count)
    @item = item
    @count = count
  end

  def calculate_result
    result = Hash.new
    if @item.discount.empty?
      result = no_discount
    elsif @item.discount == 'buy_2_free_1'
      result = buy_2_free_1
    elsif @item.discount == 'off_percent_5'
      result = off_percent_5
    end
    result
  end

  def name
    @item.name
  end

  def unit
    @item.unit
  end

  def price_per_unit
    @item.price_per_unit
  end

  def total
    calculate_result[:total]
  end

  private

  def buy_2_free_1
    if @count / 3 <= 0
      return no_discount
    end
    saved_count = @count / 3
    saved_price = saved_count * price_per_unit
    total = price_per_unit * @count - saved_price
    {total: float_of_2_decimal(total), saved_price: float_of_2_decimal(saved_price), saved_count: saved_count}
  end

  def no_discount
    {total: float_of_2_decimal(price_per_unit * @count), saved_price: 0, saved_count: 0}
  end

  def off_percent_5
    origin = price_per_unit * @count
    saved_price = origin * 0.05
    total = origin - saved_price
    {total: float_of_2_decimal(total), saved_price: float_of_2_decimal(saved_price), saved_count: 0}
  end

  def float_of_2_decimal(price)
    price.round(2)
  end

end
