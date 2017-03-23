require 'journey'

describe Journey do

  subject(:journey) {described_class.new}
  let(:station) {double :station}

  describe '#start' do
    it 'assigns an entry station' do
      journey.start(station)
      expect(journey.entry_station).to eq station
    end
  end

end
