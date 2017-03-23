class Journey

attr_reader :entry_station


def start(start_station)
  self.entry_station = start_station
end

def finish(finish_station)
  journey = {entry_station => finish_station}
  self.entry_station = nil
  journey
end

private
attr_writer :entry_station


end
