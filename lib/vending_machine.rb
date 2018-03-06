require_relative 'stock'
require_relative 'change_machine'

class VendingMachine
  attr_reader :stock, :change_machine

  def initialize(stock=Stock.new, change_machine=ChangeMachine.new)
    @stock = stock
    @change_machine = change_machine
  end

  def select_item(item)
    fail "You have insufficient change and need to add #{cost_change_difference(item)}p more to buy a #{item}" if insufficient_change?(item)
    p "Please collect your change of #{change_given(item)}p" unless change?(item)
    change_machine.return_change(price?(item))
    change_machine.complete_transaction
    stock.remove(item)
  end

  def add_coin(coin)
    change_machine.add(coin)
  end

  def total_change_given
    change_machine.total_change
  end

  def return_change_given
    change_machine.return_given_change
  end

  private

  def insufficient_change?(item)
    total_change_given < price?(item)
  end

  def cost_change_difference(item)
    price?(item) - total_change_given
  end

  def change_given(item)
    total_change_given - price?(item)
  end

  def change?(item)
    change_given(item).zero?
  end

  def price?(item)
    stock.price_list[item]
  end
end
