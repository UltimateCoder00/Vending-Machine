require 'csv'

class Stock
  attr_reader :prices, :quantities

  def initialize
    @prices = CSV.new(File.new(Dir.pwd + '/lib/stock_prices_db.csv')).to_h
    @quantities = CSV.new(File.new(Dir.pwd + '/lib/stock_quantities_db.csv')).to_h
    render_db
  end

  def add(product, quantity=1)
    fail "Error: The product is invalid and cannot be added to stock" unless exists?(product)
    quantities[product] += quantity
  end

  def remove(product)
    fail "Error: The product is invalid and cannot be removed from stock" unless exists?(product)
    quantities[product] -= 1
  end

  private

  def render_db
    render_prices_db
    render_quantities_db
  end

  def render_prices_db
    prices.each { |k, v| prices[k] = v.to_f / 100 }
  end

  def render_quantities_db
    quantities.each { |k, v| quantities[k] = v.to_i }
  end

  def exists?(product)
    prices.include?(product)
  end
end
