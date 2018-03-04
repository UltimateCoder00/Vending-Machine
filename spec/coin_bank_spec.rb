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
  end
end
