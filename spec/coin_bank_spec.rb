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
  end
end
