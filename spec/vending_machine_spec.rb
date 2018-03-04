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
  end
end
