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

    it 'Add multiple quantities of a product' do
      product = "Coca Cola"
      quantity = stock.quantities[product]
      quantity_number = 5
      stock.add(product, quantity_number)
      expect(stock.quantities[product]).to eq quantity + quantity_number
    end

    it 'Adding invalid product to stock' do
      product = "Fizzy Cola"
      expect{stock.add(product)}.to raise_error "The product is invalid and cannot be added to stock"
    end
  end

  describe '#remove' do
    it 'Remove product from stock' do
      product = "Coca Cola"
      quantity = stock.quantities[product]
      stock.remove(product)
      expect(stock.quantities[product]).to eq quantity - 1
    end

    it 'Remove out of stock product from stock' do
      product = "Coca Cola"
      10.times {stock.remove(product)}
      expect{stock.remove(product)}.to raise_error "There is no product to remove"
    end

    it 'Removing invalid product from stock' do
      product = "Fizzy Cola"
      expect{stock.remove(product)}.to raise_error "The product is invalid and cannot be removed from stock"
    end
  end
end
