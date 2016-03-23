require 'rspec'
require_relative '../lib/cash_register'
require_relative '../lib/model/item'

describe 'CashRegister' do
  describe '#calculate' do
    subject { CashRegister.calculate(item_list) }
    let(:item_list) { [ double('item_1', price: 6.00),
                        double('item_2', price: 3.50) ] }
    specify { expect(subject).to eq(9.50) }
  end

  describe '#print' do
    subject { CashRegister.print_text(item_list) }
    let(:item_list) { [ double('item_1', name:'可口可乐', unit:'瓶', price_per_unit: 1.0, count: 2, discount: '', price: 2.0) ]}
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
end
