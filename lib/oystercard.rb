require_relative 'journey'

class Oystercard

  attr_reader :balance, :in_journey, :journey, :journeys

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = 1

  def initialize
    @balance = 0
    @journey = Journey.new
    @journeys = []
  end

  def top_up(money)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if money + balance > MAXIMUM_BALANCE
    self.balance += money
  end

  def touch_in(station)
    fail "Minimum £1 needed to touch in" if balance < MINIMUM_BALANCE
    journey.start(station)
  end

  def touch_out(exit_station)
    trip = journey.finish(exit_station)
    journeys << trip
    deduct_money(journey.fare(trip))
  end

  def in_journey?
    !journey.is_complete?
  end

  private

  attr_writer :balance, :in_journey, :journey

  def deduct_money(money)
    self.balance -= money
  end

end
