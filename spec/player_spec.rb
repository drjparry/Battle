require 'player'

feature Player do

  # As Player 1,
  # So I can start to win a game of Battle,
  # I want my attack to reduce Player 2's HP
  scenario 'it reduces player 2s hitpoints' do
    sign_in_and_play
    expect($player_1.name).to eq 'Dave'
  end
end
