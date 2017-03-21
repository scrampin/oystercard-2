require 'oystercard'

describe Oystercard do

  let(:journey) { Journey.new }

  it 'has a balance of 0' do
    expect(subject.balance).to eq 0
  end

  it 'adds money to the balance' do
    expect{ subject.top_up 10 }.to change{ subject.balance }.by 10
  end

  it "raises an error when maximum balance is exceeded" do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
    expect{subject.top_up(1)}.to raise_error "Maximum balance of #{maximum_balance} exceeded"
  end

  it 'deducts money from card' do
    subject.top_up(20)
    expect{subject.deduct_money(5)}.to change{subject.balance}.by -5
  end

  describe '#in_journey?' do
    it 'is initially not in a journey' do
      expect(subject.in_journey).to be false
    end
  end

  describe '#touch_in' do
    it 'can touch in' do
      subject.top_up(5)
      subject.touch_in
      expect(subject.in_journey).to be true
    end

    it 'checks minimum balance on touch in' do
      message = "Minimum £1 needed to touch in"
      expect{ subject.touch_in }.to raise_error message
    end
  end

  describe '#touch_out' do
    it 'can touch out' do
      subject.top_up(5)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

    it 'deducts minimum fare' do
      subject.top_up(5)
      subject.touch_in
      subject.touch_out
      expect {subject.deduct_money(1)}.to change{subject.balance}.by(-1)
    end
  end
end
