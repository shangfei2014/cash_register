require 'rspec'
require_relative '../../lib/model/item'

describe 'Item' do
  describe '#calculate_result' do
    subject { Item.new('可乐', '瓶', price_per_unit, count, discount).calculate_result }

    context 'no discount' do
      let(:price_per_unit) { 1.00 }
      let(:count) { 2 }
      let(:discount) { '' }
      specify { expect(subject).to eq({ total: '2.00', saved_price: '0.00', saved_count: 0 }) }
    end

    context 'buy_2_free_1' do
      let(:price_per_unit) { 1.00 }
      let(:count) { 3 }
      let(:discount) { 'buy_2_free_1' }

      specify { expect(subject).to eq({ total: '2.00', saved_price: '1.00', saved_count: 1 }) }
    end

    context 'off_percent_5' do
      let(:price_per_unit) { 1.00 }
      let(:count) { 3 }
      let(:discount) { 'off_percent_5' }

      specify { expect(subject).to eq({ total: '2.85', saved_price: '0.15', saved_count: 0 }) }
    end
  end
end
