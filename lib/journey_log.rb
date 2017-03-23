require_relative 'journey'

class JourneyLog
  attr_reader :journey_class

  def initialize(journey = Journey)
    @journey_class = journey
  end
end
