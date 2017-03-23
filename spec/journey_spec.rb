require 'journey'

describe Journey do

  subject(:journey) {described_class.new}
  let(:start_station) {double :station}
  let(:finish_station) {double :station}

  describe '#start' do
    it 'assigns an entry station' do
      journey.start(start_station)
      expect(journey.entry_station).to eq start_station
    end
  end

  describe '#finish' do
    it 'assigns an exit station' do
      journey.start(start_station)
      journey.finish(finish_station)
      expect(journey.entry_station).to be_nil
    end

    it 'outputs journey data' do
      journey.start(start_station)
      expect(journey.finish(finish_station)).to eq ([start_station, finish_station])
    end
  end

  describe '#fare' do
    it 'returns the minimum fare' do
      journey.start(start_station)
      # journey.finish(finish_station)
      expect(journey.fare(journey.finish(finish_station))).to eq Journey::MINIMUM_FARE
    end

    it 'returns a penalty of 6 if no entry station' do
      completed_trip = journey.finish(finish_station)
      expect(journey.fare(completed_trip)).to eq Journey::PENALTY_FARE
    end
  end

  describe '#is_complete?' do
    it 'states whether the journey is completed' do
      journey.start(start_station)
      journey.finish(finish_station)
      expect(journey.is_completed?).to be_true
    end
  end

end
