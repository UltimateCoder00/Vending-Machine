require 'csv'

class MoneyVault
  attr_reader :coin_stored_list

  def initialize
    @coin_stored_list = CSV.new(File.new(Dir.pwd + './db/coin_stored_list_db.csv')).to_h
    render_db
  end

  def add(coin, quantity=1)
    fail "The coin is invalid and cannot be added to bank" unless exists?(coin)
    coin_stored_list[coin] += quantity
  end

  def remove(coin)
    fail "The coin is invalid and cannot be removed from bank" unless exists?(coin)
    fail "There is no coin to remove" if empty?(coin)
    coin_stored_list[coin] -= 1
  end

  private

  def render_db
    coin_stored_list.each { |k, v| coin_stored_list[k] = v.to_i }
  end

  def exists?(coin)
    coin_stored_list.include?(coin)
  end

  def empty?(coin)
    coin_stored_list[coin].zero?
  end
end
