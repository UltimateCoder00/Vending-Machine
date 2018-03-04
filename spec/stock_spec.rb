require 'stock'

describe Stock do
  subject(:stock) {described_class.new}

  describe '#add' do
    it 'Add product to stock' do
      product = "Coca Cola"
      quantity = stock.quantities[product]
      stock.add(product)
      expect(stock.quantities[product]).to eq quantity + 1
    end
  end

  describe '#remove' do
    it 'Remove product from stock' do
      product = "Coca Cola"
      quantity = stock.quantities[product]
      stock.remove(product)
      expect(stock.quantities[product]).to eq quantity - 1
    end
  end
end
