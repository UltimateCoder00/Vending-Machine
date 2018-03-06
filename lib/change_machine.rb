require_relative 'money_vault'

class ChangeMachine
  attr_reader :change, :vault

  def initialize(vault=MoneyVault.new)
    @change = empty_change_vault
    @vault = vault
  end

  def add(coin)
    fail "The coin is invalid and cannot be added" unless coin_exists?(coin)
    change[coin] += 1
  end

  def total_change
    total = 0
    change.each { |k, v| total += k.to_i * v }
    total
  end

  def return_given_change
    @change = empty_change_vault
  end

  def complete_transaction
    vault.coin_stored_list.each { |k, _v| vault.coin_stored_list[k] += change[k] }
    return_given_change
  end

  def return_change(item_cost)
    change = total_change - item_cost
    vault.coin_stored_list.reverse_each do |k, v|
      next if change < k.to_i
      vault.coin_stored_list[k] -= change / k.to_i
      change = change % k.to_i
    end
    change
  end

  private

  def empty_change_vault
    {"1"=>0, "2"=>0, "5"=>0, "10"=>0, "20"=>0, "50"=>0, "100"=>0, "200"=>0}
  end

  def coin_exists?(coin)
    change.include?(coin)
  end
end
