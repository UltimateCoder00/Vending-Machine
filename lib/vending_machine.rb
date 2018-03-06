require_relative 'stock'
require_relative 'change_machine'

class VendingMachine
  attr_reader :stock, :change_machine

  def initialize(stock=Stock.new, change_machine=ChangeMachine.new)
    @stock = stock
    @change_machine = change_machine
  end

  def purchase(item)
    fail "You have insufficient change and need to add #{missing_change(item)}p more to buy a #{item}" if insufficient_change?(item)
    p "Please collect your change of #{change_given(item)}p" unless change?(item)
    change_machine.return_change(item_price(item))
    stock.remove(item)
  end

  def add(coin)
    change_machine.add(coin)
  end

  def total_change_given
    change_machine.total_change
  end

  def return_change
    change_machine.return_given_change
  end

  private

  def insufficient_change?(item)
    total_change_given < item_price(item)
  end

  def missing_change(item)
    item_price(item) - total_change_given
  end

  def change_given(item)
    total_change_given - item_price(item)
  end

  def change?(item)
    change_given(item).zero?
  end

  def item_price(item)
    stock.price_list[item]
  end
end
