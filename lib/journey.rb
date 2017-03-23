class Journey

attr_reader :entry_station


def start(station)
  self.entry_station = station
end

private
attr_writer :entry_station


end
