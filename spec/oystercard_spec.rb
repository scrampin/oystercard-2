require 'oystercard'

describe Oystercard do

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

end
