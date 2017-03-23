require_relative 'journey'

class JourneyLog
  attr_reader :journey_class, :journey

  def initialize(journey = Journey)
    @journey_class = journey
  end

  def begin(station)
    @journey = journey_class.new
    @journey.start(station)
  end

  def end(station)
    journey.finish(station)
  end


  private

  def current_journey
    return journey_class.new if journey.nil?
    journey
  end

end
