class ChangeMachine
  attr_reader :coins

  def initialize
    @coins = change_hash
  end

  def add_coin(coin)
    fail "The coin is invalid and cannot be added" unless exists?(coin)
    coins[coin] += 1
  end

  def total_change
    total = 0
    coins.each { |k, v| total += k.to_i * v }
    total
  end

  def return_change
    @coins = change_hash
  end

  private

  def change_hash
    {"1"=>0, "2"=>0, "5"=>0, "10"=>0, "20"=>0, "50"=>0, "100"=>0, "200"=>0}
  end

  def exists?(coin)
    coins.include?(coin)
  end
end
