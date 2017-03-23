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
      expect(journey.finish(finish_station)).to eq ({start_station => finish_station})
    end

  end

end
