require 'vending_machine'

describe VendingMachine do
  subject(:vending_machine) {described_class.new}

  describe '#add_coin' do
    it 'Add change' do
      coin = "50"
      expect(vending_machine.change[coin]).to eq 0
      vending_machine.add_coin(coin)
      expect(vending_machine.change[coin]).to eq 1
    end

    it 'Adding invalid coin' do
      coin = "30"
      error_message = "The coin is invalid and cannot be added"
      expect{vending_machine.add_coin(coin)}.to raise_error error_message
    end
  end

  describe '#select_item' do
    it 'Select item' do
      item = "Coca Cola"
      quantity = vending_machine.stock.quantities[item]
      expect(vending_machine.select_item(item)).to eq quantity - 1
    end
  end
end
