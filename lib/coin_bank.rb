require 'csv'

class CoinBank
  attr_reader :quantities

  def initialize
    @quantities = CSV.new(File.new(Dir.pwd + '/lib/coin_bank_db.csv')).to_h
    render_db
  end

  private

  def render_db
    quantities.each { |k, v| quantities[k] = v.to_i }
  end
end
