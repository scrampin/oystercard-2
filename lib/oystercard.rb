class Oystercard

  attr_reader :balance

  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(money)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if money + balance > MAXIMUM_BALANCE
    self.balance += money
  end

  def deduct_money(money)
    self.balance -= money
  end

  private

  attr_writer :balance

end
