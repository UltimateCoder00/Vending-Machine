require 'csv'

class Stock
  attr_reader :prices, :quantities

  def initialize
    @prices = CSV.new(File.new(Dir.pwd + '/stock_prices_db.csv')).to_h
    @quantities = CSV.new(File.new(Dir.pwd + '/stock_quantities_db.csv')).to_h
    render_db
  end

  def render_db
    render_prices_db
    render_quantities_db
  end

  def render_prices_db
    prices.each { |key, value| prices[key] = value.to_f / 100 }
  end

  def render_quantities_db
    quantities.each { |key, value| quantities[key] = value.to_i }
  end
end
