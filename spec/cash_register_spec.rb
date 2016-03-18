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
end
