require 'station'

describe Station do

  it 'knows its name' do
    station = Station.new("Marble Arch", 1)
    expect(station.name).to eq "Marble Arch"
  end
  it 'knows its name' do
    station = Station.new("Marble Arch", 1)
    expect(station.zone).to eq 1
  end
end
