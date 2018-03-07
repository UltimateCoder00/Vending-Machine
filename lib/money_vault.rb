require 'csv'

class MoneyVault
  attr_reader :coin_stored_list

  def initialize
    @coin_stored_list = CSV.new(File.new(Dir.pwd + '/db/coin_stored_list_db.csv')).to_h
    render_coin_stored_db
  end

  def add(coin, quantity=1)
    fail "The coin is invalid and cannot be added to bank" unless coin_exists?(coin)
    coin_stored_list[coin] += quantity
  end

  def remove(coin)
    fail "The coin is invalid and cannot be removed from bank" unless coin_exists?(coin)
    fail "There is no coin to remove" if coin_emptied?(coin)
    coin_stored_list[coin] -= 1
  end

  private

  def render_coin_stored_db
    coin_stored_list.each { |k, v| coin_stored_list[k] = v.to_i }
  end

  def coin_exists?(coin)
    coin_stored_list.include?(coin)
  end

  def coin_emptied?(coin)
    coin_stored_list[coin].zero?
  end
end
