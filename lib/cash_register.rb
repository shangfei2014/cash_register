class CashRegister
  def self.calculate(item_list)
    total_price = 0
    item_list.each do |item|
      total_price += item.price
    end
    total_price
  end

  def self.print_text(item_list)
    receipt = ""
    receipt << "***<没钱赚商店>购物清单***\n"
    item_list.each do |item|
      receipt << "名称：#{item.name}，数量：#{item.count}#{item.unit}，单价：#{item.price_per_unit.round(2)}(元)，小计：#{item.price}(元)\n"
    end
    receipt << "----------------------\n总计：#{calculate(item_list)}(元)\n**********************\n"
    receipt
  end

end
