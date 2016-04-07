class CashRegister

  def self.print_text(item_list)
    receipt = ''
    total_saved_price = 0
    total_price = 0
    saved_list = Array.new
    receipt << "***<没钱赚商店>购物清单***\n"
    item_list.each do |item|
      calculate_result = item.calculate_result
      receipt << "名称：#{item.name}，数量：#{item.count}#{item.unit}，单价：#{format_price(item.price_per_unit)}(元)，小计：#{format_price(item.total)}(元)\n"
      total_saved_price += calculate_result[:saved_price]
      total_price += calculate_result[:total]
      if calculate_result[:saved_count] > 0
        saved_list.push(item)
      end
    end
    receipt << print_text_free_goods(saved_list)
    receipt << print_text_footer(total_price, total_saved_price)
    receipt
  end

  private

  def self.print_text_free_goods(item_list)
    receipt = ''
    unless item_list.empty?
      item_list.each do |item|
        receipt << "名称：#{item.name}，数量：#{item.calculate_result[:saved_count]}#{item.unit}\n"
      end
      receipt = "----------------------\n买二赠一商品：\n#{receipt}"
    end
    receipt
  end

  def self.print_text_footer(total, total_saved_price)
    receipt = ''
    receipt << "----------------------\n总计：#{format_price(total)}(元)\n"
    if total_saved_price > 0
      receipt << "节省：#{format_price(total_saved_price)}(元)\n"
    end
    receipt << "**********************\n"
    receipt
  end

  def self.format_price(price)
    '%.2f' % price
  end

end
