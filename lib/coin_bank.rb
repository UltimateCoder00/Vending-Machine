require 'csv'

class CoinBank
  attr_reader :quantities

  def initialize
    @quantities = CSV.new(File.new(Dir.pwd + '/lib/coin_bank_db.csv')).to_h
    render_db
  end

  def add(coin, quantity=1)
    fail "The coin is invalid and cannot be added to bank" unless exists?(coin)
    quantities[coin] += quantity
  end

  def remove(coin)
    fail "The coin is invalid and cannot be removed from bank" unless exists?(coin)
    fail "There is no coin to remove" if empty?(coin)
    quantities[coin] -= 1
  end

  private

  def render_db
    quantities.each { |k, v| quantities[k] = v.to_i }
  end

  def exists?(coin)
    quantities.include?(coin)
  end

  def empty?(coin)
    quantities[coin].zero?
  end
end
