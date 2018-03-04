require 'csv'

class CoinBank
  attr_reader :quantities

  def initialize
    @quantities = CSV.new(File.new(Dir.pwd + '/lib/coin_bank_db.csv')).to_h
  end
end
