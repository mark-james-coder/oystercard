require 'oystercard'
require 'journey'

describe Oystercard do

  let (:entry_station) { double :entry_station }
  let (:exit_station) { double :exit_station }

  it 'initializes with a balance of 0' do
    expect(subject.balance).to eq 0
  end
  it 'tops up the balance by an amount' do
    expect { subject.top_up(20) }.to change { subject.balance }.by(20)
  end
  it 'has a maximum balance limit of 90' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up maximum_balance
    expect { subject.top_up(1)}.to raise_error "Top-up unsuccessful: maximum balance limit is #{maximum_balance}"
  end
  # it "initializes with a status of not being in a journey" do
  #   expect(subject.in_journey?).to eq false
  # end
  it "can touch in" do
    subject.top_up(20)
    journey = Journey.new(:entry_station)
    subject.touch_in(:entry_station)
    expect(journey.entry_station).to eq :entry_station
  end
  # it "can touch out" do
  #   subject.top_up(20)
  #   journey = Journey.new(:entry_station)
  #   subject.touch_in(:entry_station)
  #   subject.touch_out(:exit_station)
  #   expect(journey.exit_station).to eq nil
  # end
  it "requires a mininum balance of 1 at touch in" do
    expect { subject.touch_in(:entry_station) }.to raise_error "Insufficient balance"
  end
  # it "deducts the balance by the minimum fare on touch out" do
  #   subject.top_up(20)
  #   subject.touch_in(:entry_station)
  #   expect { subject.touch_out(:exit_station) }.to change { subject.balance }.by(-Oystercard::MINIMUM_FARE)
  # end
  # it 'remembers entry station on touch in' do
  #   subject.top_up(20)
  #   subject.touch_in(:entry_station)
  #   expect(subject.entry_station).to eq :entry_station
  # end
  # it 'forgets entry station on touch out' do
  #   subject.top_up(20)
  #   subject.touch_in(:entry_station)
  #   subject.touch_out(:exit_station)
  #   expect(subject.entry_station).to eq nil
  # end
  it 'has an empty list of journeys by default' do
    expect(subject.journeys).to be_empty
  end
  # it 'touching in and out creates one journey' do
  #   subject.top_up(20)
  #   subject.touch_in(:entry_station)
  #   subject.touch_out(:exit_station)
  #   expect(subject.journeys.size).to eq 1
  # end
end
