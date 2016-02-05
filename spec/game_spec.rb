require 'game'

describe Game do
  
  subject(:game) {described_class.new(dave, marco)}
  let(:marco){double(:marco)}
  let(:dave){double(:dave)}

   describe '#attack' do

    it 'allows a user to attack another user' do
      expect(marco).to receive(:receive_damage)
      game.attack(marco)
    end
  end
  
  describe '#switch_turn' do
    
    it "changes the current player's turn" do
      allow(marco).to receive(:receive_damage)
      allow(marco).to receive(:name).and_return("Marco")
      allow(dave).to receive(:name).and_return("Dave")
      expect{ game.switch_turns}.to change{ game.current}.to game.player_2
    end
  end
  
end
