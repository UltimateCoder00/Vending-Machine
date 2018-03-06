require 'csv'

class Stock
  attr_reader :price_list, :product_quantity_list
  MAXPRODUCTQUANTITY = 10

  def initialize
    @price_list = CSV.new(File.new(Dir.pwd + './db/stock_product_price_list_db.csv')).to_h
    @product_quantity_list = CSV.new(File.new(Dir.pwd + './db/stock_product_quantity_list_db.csv')).to_h
    render_stock_product_db
  end

  def add(product, quantity=1)
    fail "The product is invalid and cannot be added to stock" unless product_exists?(product)
    product_maxed?(product, quantity) ? max_product_quantity(product) : add_product(product, quantity)
  end

  def remove(product)
    fail "The product is invalid and cannot be removed from stock" unless product_exists?(product)
    fail "There is no product to remove" if product_empty?(product)
    product_quantity_list[product] -= 1
  end

  private

  def render_stock_product_db
    render_stock_product_price_list_db
    render_stock_product_quantity_list_db
  end

  def render_stock_product_price_list_db
    price_list.each { |k, v| price_list[k] = v.to_i }
  end

  def render_stock_product_quantity_list_db
    product_quantity_list.each { |k, v| product_quantity_list[k] = v.to_i }
  end

  def product_exists?(product)
    price_list.include?(product)
  end

  def max_product_quantity(product)
    product_quantity_list[product] = MAXPRODUCTQUANTITY
  end

  def add_product(product, quantity)
     product_quantity_list[product] += quantity
  end

  def product_empty?(product)
    product_quantity_list[product].zero?
  end

  def product_maxed?(product, quantity)
    product_quantity_list[product] + quantity > MAXPRODUCTQUANTITY
  end
end
