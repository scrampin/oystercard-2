require 'journey_log'

describe JourneyLog do

  subject(:journey_log) {described_class.new}
  let(:station) {double :station}

  describe '#initialize' do
    it 'initializes with journey_class: Journey' do
      expect(journey_log.journey_class).to eq Journey
    end
  end

  describe '#start' do
    it 'starts a new journey with an entry station' do
      journey_log.start(station).to eq (journey_class.new.start(station))
    end
  end



end
