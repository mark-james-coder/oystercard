class Journey

  attr_accessor :entry_station, :exit_station
  attr_reader :fare

  PENALTY_FARE = 6
  MINIMUM_FARE = 1

  def initialize(entry_station)
    @entry_station = entry_station
  end

  def finish(exit_station)
    @exit_station = exit_station
    @fare = fare
    self
  end

  def fare
    if complete?
      MINIMUM_FARE
    else
      PENALTY_FARE
    end
  end

  def complete?
    @entry_station && @exit_station
  end

end
