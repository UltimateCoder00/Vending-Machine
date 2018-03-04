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
    stock.remove(item)
  end

  def add_coin(coin)
    fail "The coin is invalid and cannot be added" unless exists?(coin)
    change[coin] += 1
  end

  private

  def change_hash
    {"1"=>0, "2"=>0, "5"=>0, "10"=>0, "20"=>0, "50"=>0, "100"=>0, "200"=>0}
  end

  def exists?(coin)
    change.include?(coin)
  end
end
