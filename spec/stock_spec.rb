require 'stock'

describe Stock do
  subject(:stock) {described_class.new}

  describe '#add' do
    it 'Add product to stock' do
      product = "Coca Cola"
      5.times {stock.remove(product)}
      quantity = stock.product_quantity_list[product]
      stock.add(product)
      expect(stock.product_quantity_list[product]).to eq quantity + 1
    end

    it 'Add multiple quantities of a product' do
      product = "Coca Cola"
      6.times {stock.remove(product)}
      quantity = stock.product_quantity_list[product]
      quantity_number = 5
      stock.add(product, quantity_number)
      expect(stock.product_quantity_list[product]).to eq quantity + quantity_number
    end

    it 'Adding invalid product to stock' do
      product = "Fizzy Cola"
      error_message = "The product is invalid and cannot be added to stock"
      expect{stock.add(product)}.to raise_error error_message
    end

    it 'Add more product than max allowed' do
      product = "Coca Cola"
      5.times {stock.remove(product)}
      quantity_number = 10
      stock.add(product, quantity_number)
      expect(stock.product_quantity_list[product]).to eq 10
    end
  end

  describe '#remove' do
    it 'Remove product from stock' do
      product = "Coca Cola"
      quantity = stock.product_quantity_list[product]
      stock.remove(product)
      expect(stock.product_quantity_list[product]).to eq quantity - 1
    end

    it 'Remove out of stock product from stock' do
      product = "Coca Cola"
      10.times {stock.remove(product)}
      error_message = "There is no product to remove"
      expect{stock.remove(product)}.to raise_error error_message
    end

    it 'Removing invalid product from stock' do
      product = "Fizzy Cola"
      error_message = "The product is invalid and cannot be removed from stock"
      expect{stock.remove(product)}.to raise_error error_message
    end
  end
end
