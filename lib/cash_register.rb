class CashRegister

  def self.print_text(item_list)
    receipt = ''
    total_saved_price = 0
    total_price = 0
    saved_list = Array.new
    receipt << "***<没钱赚商店>购物清单***\n"
    item_list.each do |item|
      total_price, total_saved_price, line_text = print_text_item_line(item, total_price, total_saved_price, saved_list)
      receipt << line_text
    end
    receipt << print_text_free_goods(saved_list)
    receipt << print_text_footer(total_price, total_saved_price)
    receipt
  end

  private

  def self.print_text_item_line(item, total_price, total_saved_price, saved_list)
    text = ''
    calculate_result = item.calculate_result
    text += "名称：#{item.name}，数量：#{item.count}#{item.unit}，单价：#{format_price(item.price_per_unit)}(元)，小计：#{format_price(calculate_result[:total])}(元)"
    total_saved_price += calculate_result[:saved_price]
    total_price += calculate_result[:total]
    if calculate_result[:saved_count] > 0
      saved_list.push(item)
      text += "\n"
    elsif calculate_result[:saved_price] > 0
      text += "，节省#{format_price(calculate_result[:saved_price])}(元)\n"
    else
      text += "\n"
    end
    return total_price, total_saved_price, text
  end

  def self.print_text_free_goods(item_list)
    text = ''
    unless item_list.empty?
      item_list.each do |item|
        text += "名称：#{item.name}，数量：#{item.calculate_result[:saved_count]}#{item.unit}\n"
      end
      text = "----------------------\n买二赠一商品：\n#{text}"
    end
    text
  end

  def self.print_text_footer(total, total_saved_price)
    text = ''
    text += "----------------------\n总计：#{format_price(total)}(元)\n"
    if total_saved_price > 0
      text += "节省：#{format_price(total_saved_price)}(元)\n"
    end
    text += "**********************\n"
    text
  end

  def self.format_price(price)
    '%.2f' % price
  end

end
