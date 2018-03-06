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

  describe '#complete_transaction' do
    it 'Complete Transaction' do
      coin_bank_hash = {"1"=>1000, "2"=>500, "5"=>200, "10"=>200, "20"=>100, "50"=>100, "100"=>100, "200"=>50}
      expect(change_machine.bank.coin_stored_list).to eq coin_bank_hash
      change_machine.add_coin("50")
      change_machine.add_coin("20")
      change_machine.add_coin("100")
      coins = {"1"=>0, "2"=>0, "5"=>0, "10"=>0, "20"=>1, "50"=>1, "100"=>1, "200"=>0}
      expect(change_machine.coins).to eq coins
      new_coin_bank_hash = {"1"=>1000, "2"=>500, "5"=>200, "10"=>200, "20"=>101, "50"=>101, "100"=>101, "200"=>50}
      change_machine.complete_transaction
      expect(change_machine.bank.coin_stored_list).to eq new_coin_bank_hash
      new_coins = {"1"=>0, "2"=>0, "5"=>0, "10"=>0, "20"=>0, "50"=>0, "100"=>0, "200"=>0}
      expect(change_machine.coins).to eq new_coins
    end
  end

  describe '#return_transcation_change' do
    it 'Return change 1' do
      coin_bank_hash = {"1"=>1000, "2"=>500, "5"=>200, "10"=>200, "20"=>100, "50"=>100, "100"=>100, "200"=>50}
      expect(change_machine.bank.coin_stored_list).to eq coin_bank_hash
      change_machine.add_coin("50")
      change_machine.add_coin("20")
      change_machine.add_coin("100")
      expect(change_machine.total_change).to eq 170
      item_cost = 80
      new_coin_bank_hash = {"1"=>1000, "2"=>500, "5"=>200, "10"=>200, "20"=>98, "50"=>99, "100"=>100, "200"=>50}
      change_machine.return_transcation_change(item_cost)
      expect(change_machine.bank.coin_stored_list).to eq new_coin_bank_hash
    end

    it 'Return change 2' do
      coin_bank_hash = {"1"=>1000, "2"=>500, "5"=>200, "10"=>200, "20"=>100, "50"=>100, "100"=>100, "200"=>50}
      expect(change_machine.bank.coin_stored_list).to eq coin_bank_hash
      change_machine.add_coin("10")
      change_machine.add_coin("200")
      change_machine.add_coin("1")
      expect(change_machine.total_change).to eq 211
      item_cost = 78
      new_coin_bank_hash = {"1"=>999, "2"=>499, "5"=>200, "10"=>199, "20"=>99, "50"=>100, "100"=>99, "200"=>50}
      change_machine.return_transcation_change(item_cost)
      expect(change_machine.bank.coin_stored_list).to eq new_coin_bank_hash
    end
  end
end
