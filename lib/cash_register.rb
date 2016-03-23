class CashRegister
  def self.calculate(item_list)
    total_price = 0
    saved_price = 0
    saved_count = 0
    item_list.each do |item|
      total_price += item.calculate_result[:total].to_f
      saved_price += item.calculate_result[:saved_price].to_f
    end
    { total: total_price, saved_price: saved_price, saved_count: saved_count }
  end

  def self.print_text(item_list)
    receipt = ""
    buy_2_free_1_receipt = ''
    total_saved_price = 0
    receipt << "***<没钱赚商店>购物清单***\n"
    item_list.each do |item|
      receipt << "名称：#{item.name}，数量：#{item.count}#{item.unit}，单价：#{ format_price(item.price_per_unit) }(元)，小计：#{item.calculate_result[:total]}(元)\n"
      total_saved_price += item.calculate_result[:saved_price].to_f
      if item.calculate_result[:saved_count] > 0
        buy_2_free_1_receipt << "名称：#{item.name}，数量：#{item.calculate_result[:saved_count]}#{item.unit}\n"
      end
    end
    unless buy_2_free_1_receipt.empty?
      receipt << "----------------------\n买二赠一商品：\n#{buy_2_free_1_receipt}"
    end
    if total_saved_price > 0
      receipt << "----------------------\n总计：#{format_price(calculate(item_list)[:total])}(元)\n节省：#{format_price(total_saved_price)}(元)\n**********************\n"
    else
      receipt << "----------------------\n总计：#{format_price(calculate(item_list)[:total])}(元)\n**********************\n"
    end
    receipt
  end

  private

  def self.format_price(price)
    '%.2f' % price
  end

end
