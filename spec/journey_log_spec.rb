require 'journey_log'

describe JourneyLog do

  subject(:journey_log) {described_class.new}
  let(:start_station) {double :start_station}
  let(:end_station) {double :end_station}

  describe '#initialize' do
    it 'initializes with journey_class: Journey' do
      expect(journey_log.journey_class).to eq Journey
    end
  end

  describe '#begin' do
    it 'starts a new journey with an entry station' do
      journey_log.begin(start_station)
      expect(journey_log.journey.entry_station).to eq start_station
    end
  end

  describe '#end' do
    it 'adds an exit station to the journey' do
      journey_log.begin(start_station)
      expect(journey_log.end(end_station)[start_station]).to eq end_station
    end
  end

end
