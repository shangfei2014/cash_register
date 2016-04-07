require 'rspec'
require_relative '../lib/cash_register'
require_relative '../lib/model/item_line'

describe 'CashRegister' do

  describe '#print' do
    subject { CashRegister.print_text(item_list) }
    context 'no discount' do
      let(:item_list) { [double('item_1', name: '可口可乐', unit: '瓶', price_per_unit: 1.0, count: 2, discount: '',
                                calculate_result: { total: 2.00, saved_price: 0.00, saved_count: 0 })] }
      let(:output) do
        <<-eos
***<没钱赚商店>购物清单***
名称：可口可乐，数量：2瓶，单价：1.00(元)，小计：2.00(元)
----------------------
总计：2.00(元)
**********************
        eos
      end
      specify { expect(subject).to eq(output) }
    end

    context 'buy_2_free_1' do
      let(:item_list) { [double('item_1', name: '可口可乐', unit: '瓶', price_per_unit: 1.0, count: 3, discount: 'buy_2_free_1',
                                calculate_result: { total: 2.00, saved_price: 1.00, saved_count: 1 })] }
      let(:output) do
        <<-eos
***<没钱赚商店>购物清单***
名称：可口可乐，数量：3瓶，单价：1.00(元)，小计：2.00(元)
----------------------
买二赠一商品：
名称：可口可乐，数量：1瓶
----------------------
总计：2.00(元)
节省：1.00(元)
**********************
        eos
      end
      specify { expect(subject).to eq(output) }
    end

    context 'off_percent_5' do
      let(:item_list) { [double('item_1', name: '可口可乐', unit: '瓶', price_per_unit: 1.0, count: 3, discount: 'off_percent_5',
                                calculate_result: { total: 2.85, saved_price: 0.15, saved_count: 0 })] }
      let(:output) do
        <<-eos
***<没钱赚商店>购物清单***
名称：可口可乐，数量：3瓶，单价：1.00(元)，小计：2.85(元)，节省0.15(元)
----------------------
总计：2.85(元)
节省：0.15(元)
**********************
        eos
      end
      specify { expect(subject).to eq(output) }
    end

  end
end
