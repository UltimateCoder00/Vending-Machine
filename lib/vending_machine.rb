require './lib/stock'
require './lib/coin_bank'

class VendingMachine
  attr_reader :stock, :coins, :change

  def initialize
    @stock = Stock.new
    @coins = CoinBank.new
    @change = 0
  end
end
