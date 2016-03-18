class CashRegister
  def self.calculate(item_list)
    total_price = 0
    item_list.each do |item|
      total_price += item.price
    end
    total_price
  end
end
