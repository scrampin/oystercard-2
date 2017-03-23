class Journey

attr_reader :entry_station

MINIMUM_FARE = 1
PENALTY_FARE = 6

def start(start_station)
  self.entry_station = start_station
end

def finish(finish_station)
  journey = {entry_station => finish_station}
  self.entry_station = nil
  journey
end

def fare(entry)
  return PENALTY_FARE if entry.all? {|k,v| k.nil? || v.nil?}
  MINIMUM_FARE
end

def is_complete?
  entry_station.nil?
end

private
attr_writer :entry_station


end


# def initialize(journey_class = journey)
# @journey_class = journey
# end
#
# def start
#   journey_class.new.start
# end
#
# def current_journey
# journey_class.new
# end
