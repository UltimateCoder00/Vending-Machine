require 'coin_bank'

describe CoinBank do
  subject(:coin_bank) {described_class.new}

  describe '#add' do
    it 'Add coin to coin bank' do
      coin = "50"
      quantity = coin_bank.quantities[coin]
      coin_bank.add(coin)
      expect(coin_bank.quantities[coin]).to eq quantity + 1
    end

    it 'Add multiple quantities of a coin' do
      coin = "50"
      quantity = coin_bank.quantities[coin]
      quantity_number = 5
      coin_bank.add(coin, quantity_number)
      expect(coin_bank.quantities[coin]).to eq quantity + quantity_number
    end

    it 'Adding invalid coin to coin bank' do
      coin = "30"
      error_message = "The coin is invalid and cannot be added to bank"
      expect{coin_bank.add(coin)}.to raise_error error_message
    end
  end

  describe '#remove' do
    it 'Remove coin from coin bank' do
      coin = "50"
      quantity = coin_bank.quantities[coin]
      coin_bank.remove(coin)
      expect(coin_bank.quantities[coin]).to eq quantity - 1
    end

    it 'Remove finished coin from coin bank' do
      coin = "50"
      100.times {coin_bank.remove(coin)}
      error_message = "There is no coin to remove"
      expect{coin_bank.remove(coin)}.to raise_error error_message
    end

    it 'Removing invalid coin from coin bank' do
      coin = "30"
      error_message = "The coin is invalid and cannot be removed from bank"
      expect{coin_bank.remove(coin)}.to raise_error error_message
    end
  end
end
