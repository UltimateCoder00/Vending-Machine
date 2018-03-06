require_relative 'money_vault'

class ChangeMachine
  attr_reader :coins, :bank

  def initialize(bank=MoneyVault.new)
    @coins = change_hash
    @bank = bank
  end

  def add_coin(coin)
    fail "The coin is invalid and cannot be added" unless exists?(coin)
    coins[coin] += 1
  end

  def total_change
    total = 0
    coins.each { |k, v| total += k.to_i * v }
    total
  end

  def return_change
    @coins = change_hash
  end

  def complete_transaction
    bank.coin_stored_list.each { |k, v| bank.coin_stored_list[k] += coins[k] }
    return_change
  end

  def return_transcation_change(item_cost)
    return_coins = total_change - item_cost
    bank.coin_stored_list.reverse_each do |k, v|
      next if return_coins < k.to_i
      bank.coin_stored_list[k] -= return_coins / k.to_i
      return_coins = return_coins % k.to_i
    end
  end

  private

  def change_hash
    {"1"=>0, "2"=>0, "5"=>0, "10"=>0, "20"=>0, "50"=>0, "100"=>0, "200"=>0}
  end

  def exists?(coin)
    coins.include?(coin)
  end
end
