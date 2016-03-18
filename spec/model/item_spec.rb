require 'rspec'
require_relative '../../lib/model/item'

describe 'Item' do
    describe '#price' do
      subject { Item.new(price_per_unit, count, discount).price }

      context 'no discount' do
        let(:price_per_unit) { 1.00 }
        let(:count) { 2 }
        let(:discount) { '' }
        specify { expect(subject).to eq(2.00) }
      end

      context 'buy_2_free_1' do
        let(:price_per_unit) { 1.00 }
        let(:count) { 3 }
        let(:discount) { 'buy_2_free_1' }

        specify { expect(subject).to eq(2.00) }
      end

      context 'off_percent_5' do
        let(:price_per_unit) { 1.00 }
        let(:count) { 3 }
        let(:discount) { 'off_percent_5' }

        specify { expect(subject).to eq(2.85) }
      end
    end
end
