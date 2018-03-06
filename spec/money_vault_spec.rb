require 'money_vault'

describe MoneyVault do
  subject(:money_vault) {described_class.new}

  describe '#add' do
    it 'Add coin to coin bank' do
      coin = "50"
      quantity = money_vault.quantities[coin]
      money_vault.add(coin)
      expect(money_vault.quantities[coin]).to eq quantity + 1
    end

    it 'Add multiple quantities of a coin' do
      coin = "50"
      quantity = money_vault.quantities[coin]
      quantity_number = 5
      money_vault.add(coin, quantity_number)
      expect(money_vault.quantities[coin]).to eq quantity + quantity_number
    end

    it 'Adding invalid coin to coin bank' do
      coin = "30"
      error_message = "The coin is invalid and cannot be added to bank"
      expect{money_vault.add(coin)}.to raise_error error_message
    end
  end

  describe '#remove' do
    it 'Remove coin from coin bank' do
      coin = "50"
      quantity = money_vault.quantities[coin]
      money_vault.remove(coin)
      expect(money_vault.quantities[coin]).to eq quantity - 1
    end

    it 'Remove finished coin from coin bank' do
      coin = "50"
      100.times {money_vault.remove(coin)}
      error_message = "There is no coin to remove"
      expect{money_vault.remove(coin)}.to raise_error error_message
    end

    it 'Removing invalid coin from coin bank' do
      coin = "30"
      error_message = "The coin is invalid and cannot be removed from bank"
      expect{money_vault.remove(coin)}.to raise_error error_message
    end
  end
end
