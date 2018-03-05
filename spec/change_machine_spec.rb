require 'change_machine'

describe ChangeMachine do
  subject(:change_machine) {described_class.new}

  describe '#add_coin' do
    it 'Add change' do
      coin = "50"
      expect(change_machine.coins[coin]).to eq 0
      change_machine.add_coin(coin)
      expect(change_machine.coins[coin]).to eq 1
    end

    it 'Adding invalid coin' do
      coin = "30"
      error_message = "The coin is invalid and cannot be added"
      expect{change_machine.add_coin(coin)}.to raise_error error_message
    end
  end

  describe '#total_change' do
    it 'Count total change' do
      coins = ["1", "2", "5", "10", "20", "50", "100", "200"]
      total = 388
      coins.each { |coin| change_machine.add_coin(coin) }
      expect(change_machine.total_change).to eq total
    end
  end

  describe '#return_change' do
    it 'Return change given to machine' do
      change_machine.add_coin("50")
      change_machine.add_coin("20")
      change_machine.add_coin("10")
      expect(change_machine.total_change).to eq 80
      change_machine.return_change
      expect(change_machine.total_change).to eq 0
    end
  end
end
