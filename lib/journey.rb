class Journey

attr_reader :entry_station


def start(station)
  self.entry_station = station
end

def finish(station)
  self.entry_station = nil
end

private
attr_writer :entry_station


end
