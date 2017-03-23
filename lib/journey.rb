class Journey

attr_reader :entry_station

MINIMUM_FARE = 1

def start(start_station)
  self.entry_station = start_station
end

def finish(finish_station)
  journey = {entry_station => finish_station}
  self.entry_station = nil
  journey
end

def fare
  MINIMUM_FARE
end

private
attr_writer :entry_station


end
