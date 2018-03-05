require './lib/stock'
require './lib/coin_bank'

class VendingMachine
  attr_reader :stock, :coins, :change

  def initialize
    @stock = Stock.new
    @coins = CoinBank.new
    @change = change_hash
  end

  def select_item(item)
    fail "You have insufficient change and need to add #{cost_change_difference(item)}p more to buy a #{item}" if insufficient_change?(item)
    stock.remove(item)
  end

  def add_coin(coin)
    fail "The coin is invalid and cannot be added" unless exists?(coin)
    change[coin] += 1
  end

  def total_change
    total = 0
    change.each { |k, v| total += k.to_i * v }
    total
  end

  def return_change
    @change = change_hash
  end

  private

  def change_hash
    {"1"=>0, "2"=>0, "5"=>0, "10"=>0, "20"=>0, "50"=>0, "100"=>0, "200"=>0}
  end

  def exists?(coin)
    change.include?(coin)
  end

  def insufficient_change?(item)
    total_change < stock.prices[item]
  end

  def cost_change_difference(item)
    stock.prices[item] - total_change
  end
end
