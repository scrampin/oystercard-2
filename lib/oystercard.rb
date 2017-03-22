class Oystercard

  attr_reader :balance, :in_journey

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(money)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if money + balance > MAXIMUM_BALANCE
    self.balance += money
  end

  def touch_in
    fail "Minimum £1 needed to touch in" if balance < MINIMUM_BALANCE
    self.in_journey = true
  end

  def touch_out
    deduct_money(MINIMUM_CHARGE)
    self.in_journey = false
  end

  def in_journey?
    in_journey
  end

  private

  attr_writer :balance, :in_journey

  def deduct_money(money)
    self.balance -= money
  end

end
