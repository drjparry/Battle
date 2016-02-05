require 'game'

describe Game do
  subject(:game){described_class.new(:barry, :dave)}
  let(:barry){double(:barry)}
  let(:dave){double(:dave)}

    describe '#attack' do

    it 'allows a user to attack another user' do
      expect(barry).to receive(:receive_damage)
      game.attack(barry)
    end
  end
end
