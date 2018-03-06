require 'csv'

class Stock
  attr_reader :price_list, :product_quantity_list
  MAXPRODUCTSTOCK = 10

  def initialize
    @price_list = CSV.new(File.new(Dir.pwd + './db/stock_price_list_db.csv')).to_h
    @product_quantity_list = CSV.new(File.new(Dir.pwd + './db/stock_product_quantity_list_db.csv')).to_h
    render_db
  end

  def add(product, quantity=1)
    fail "The product is invalid and cannot be added to stock" unless exists?(product)
    max?(product, quantity) ? product_quantity_list[product] = MAXPRODUCTSTOCK : product_quantity_list[product] += quantity
  end

  def remove(product)
    fail "The product is invalid and cannot be removed from stock" unless exists?(product)
    fail "There is no product to remove" if empty?(product)
    product_quantity_list[product] -= 1
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
    product_quantity_list.each { |k, v| product_quantity_list[k] = v.to_i }
  end

  def exists?(product)
    price_list.include?(product)
  end

  def empty?(product)
    product_quantity_list[product].zero?
  end

  def max?(product, quantity)
    product_quantity_list[product] + quantity > MAXPRODUCTSTOCK
  end
end
