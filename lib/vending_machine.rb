require_relative 'stock'
require_relative 'change_machine'

class VendingMachine
  attr_reader :stock, :change

  def initialize(stock=Stock.new, change=ChangeMachine.new)
    @stock = stock
    @change = change
  end

  def select_item(item)
    fail "You have insufficient change and need to add #{cost_change_difference(item)}p more to buy a #{item}" if insufficient_change?(item)
    stock.remove(item)
  end

  def add_coin(coin)
    change.add_coin(coin)
  end

  def total_change_given
    change.total_change
  end

  def return_change_given
    change.return_change
  end

  private

  def insufficient_change?(item)
    total_change_given < stock.prices[item]
  end

  def cost_change_difference(item)
    stock.prices[item] - total_change_given
  end
end
