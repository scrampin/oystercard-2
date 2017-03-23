require_relative 'journey'

class JourneyLog
  attr_reader :journey_class, :journey, :journeys

  def initialize(journey = Journey)
    @journey_class = journey
    @journeys = []
  end

  def begin(station)
    @journey = journey_class.new
    @journey.start(station)
  end

  def end(station)
    trip = journey.finish(station)
    journeys << trip
    self.journey = nil
    trip
  end


  private

  attr_writer :journey

  def current_journey
    return journey_class.new if journey.nil?
    journey
  end

end
