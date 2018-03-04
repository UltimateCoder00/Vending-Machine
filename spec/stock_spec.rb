require 'stock'

describe Stock do
  subject(:stock) {described_class.new}

  describe '#add' do
    it 'Adds product to stock' do
      product = "Coca Cola"
      quantity = stock.quantities[product]
      stock.add(product)
      expect(stock.quantities[product]).to eq quantity + 1
    end
  end
end
