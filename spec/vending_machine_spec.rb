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
      expect{vending_machine.add_coin(coin)}.to raise_error "The coin is invalid and cannot be added"
    end
  end
end
