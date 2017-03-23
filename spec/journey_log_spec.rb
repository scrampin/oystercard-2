require 'journey_log'

describe JourneyLog do

  subject(:journey_log) {described_class.new}
  let(:station) {double :station}

  describe '#initialize' do
    it 'initializes with journey_class: Journey' do
      expect(journey_log.journey_class).to eq Journey
    end
  end

  describe '#begin' do
    it 'starts a new journey with an entry station' do
      journey_log.begin(station)
      expect(journey_log.journey.entry_station).to eq station
    end
  end

  describe '#current_journey' do
    it 'returns an incomplete journey' do
      journey_log.begin(station)
      expect(journey_log.current_journey).to eq journey_log.journey
    end
  end



end
