class CashRegister
  def self.calculate(item_list)
    total_price = 0
    item_list.each do |item|
      if item.discount.empty?
        total_price += no_discount(item)
      elsif item.discount == 'buy_2_free_1'
        total_price += buy_2_free_1(item)
      end
    end
    total_price
  end

  def self.buy_2_free_1(item)
    if item.count / 3 <= 0
      return no_discount(item)
    end
    (item.count - item.count / 3) * item.price_per_unit
  end

  def self.no_discount(item)
    item.price_per_unit * item.count
  end
end
