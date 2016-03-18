require 'rspec'
require_relative '../lib/cash_register'

describe 'CashRegister' do
  describe '#calculate' do
    subject { CashRegister.calculate(item_list) }
    context 'no discount' do
      let(:item_list) { [double('item_1', price_per_unit: 1.00, count: 2, discount: ''),
                         double('item_2', price_per_unit: 2.50, count: 3, discount: '')] }
      specify { expect(subject).to eq(9.50) }
    end

    context 'buy_2_free_1' do
      let(:item_list) { [double('item_1', price_per_unit: 1.00, count: 3, discount: 'buy_2_free_1'),
                         double('item_2', price_per_unit: 2.50, count: 2, discount: 'buy_2_free_1')] }

      specify { expect(subject).to eq(7.00) }
    end

    context 'off_percent_5' do
      let(:item_list) { [double('item_1', price_per_unit: 1.00, count: 3, discount: 'off_percent_5'),
                          double('item_2', price_per_unit: 2.50, count: 2, discount: 'off_percent_5')] }
      specify { expect(subject).to eq(7.60) }
    end
  end
end
