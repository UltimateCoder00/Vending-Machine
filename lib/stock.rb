require 'csv'

class Stock
  attr_reader :prices, :quantities

  def initialize
    @prices = CSV.new(File.new(Dir.pwd + '/stock_prices_db.csv')).to_h
    @quantities = CSV.new(File.new(Dir.pwd + '/stock_quantities_db.csv')).to_h
    render_db
  end

  def render_db
    prices.each do |key, value|
      prices[key] = value.to_f / 100
    end

    quantities.each do |key, value|
      quantities[key] = value.to_i
    end
  end
end
