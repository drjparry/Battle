require 'player'

describe Player do
  subject(:dave) {Player.new('Dave')}
  subject(:barry) {Player.new('Barry')}

  # As Player 1,
  # So I can start to win a game of Battle,
  # I want my attack to reduce Player 2's HP

    describe '#name' do
    it 'it reduces player 2s hitpoints' do
    expect(dave.name).to eq 'Dave'
    end
  end

  describe '#hitpoints' do
    it 'returns the hit points' do
      expect(dave.hit_points).to eq described_class::DEFAULT_HIT_POINTS
    end
  end


  describe '#receive_damage' do
    it 'reduces the player hit points' do
      expect {dave.receive_damage }.to change { dave.hit_points }.by(-10)
    end
  end



end
