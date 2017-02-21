require_relative '../lib/place_command'

describe PlaceCommand do
  let(:command) { PlaceCommand.new '1,2,NORTH' }
  let(:robot) { double place: nil }
  before { command.call robot }
  it do
    expect(robot).to have_received(:place).with(1, 2, :north)
  end
end
