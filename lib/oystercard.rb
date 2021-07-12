require_relative 'journey'

class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1

  attr_reader :balance, :in_journey, :journeys

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    fail "Top-up unsuccessful: maximum balance limit is #{MAXIMUM_BALANCE}" if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    fail "Insufficient balance" if @balance < MINIMUM_BALANCE
    @journey = Journey.new(entry_station)
  end

  def touch_out(exit_station)
    deduct(@journey.fare)
    @journeys.push(entry_station => exit_station)
    @journey.entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
