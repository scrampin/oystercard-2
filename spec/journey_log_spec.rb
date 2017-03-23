require 'journey_log'

describe JourneyLog do

  subject(:journey_log) {described_class.new}

  describe '#initialize' do
    it 'initializes with journey_class: Journey' do
      expect(journey_log.journey_class).to eq Journey
    end
  end



end
