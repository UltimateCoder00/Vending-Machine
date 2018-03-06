require 'csv'

class Stock
  attr_reader :price_list, :quantities
  MAXPRODUCTSTOCK = 10

  def initialize
    @price_list = CSV.new(File.new(Dir.pwd + './db/stock_prices_db.csv')).to_h
    @quantities = CSV.new(File.new(Dir.pwd + './db/stock_quantities_db.csv')).to_h
    render_db
  end

  def add(product, quantity=1)
    fail "The product is invalid and cannot be added to stock" unless exists?(product)
    max?(product, quantity) ? quantities[product] = MAXPRODUCTSTOCK : quantities[product] += quantity
  end

  def remove(product)
    fail "The product is invalid and cannot be removed from stock" unless exists?(product)
    fail "There is no product to remove" if empty?(product)
    quantities[product] -= 1
  end

  private

  def render_db
    render_prices_db
    render_quantities_db
  end

  def render_prices_db
    price_list.each { |k, v| price_list[k] = v.to_i }
  end

  def render_quantities_db
    quantities.each { |k, v| quantities[k] = v.to_i }
  end

  def exists?(product)
    price_list.include?(product)
  end

  def empty?(product)
    quantities[product].zero?
  end

  def max?(product, quantity)
    quantities[product] + quantity > MAXPRODUCTSTOCK
  end
end
