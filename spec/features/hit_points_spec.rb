require 'selenium-webdriver'
require 'capybara/dsl'

feature "User Story => Battle" do
  subject(:player){described_class.new}

  def firefox
    include Capybara::DSL
    Capybara.default_driver = :selenium
  end

  # As Player 1,
  # So I can see how close I am to winning
  # I want to see Player 2's Hit Points
  scenario "allows user to see player 2's hitpoints" do
    sign_in_and_play
    expect(page).to have_content("Marco: 60 HP")
  end

  scenario "allows user to see player 1's hitpoints" do
    sign_in_and_play
    expect(page).to have_content("Dave: 60 HP")

  end

  # As Player 1,
  # So I can win a game of Battle,
  # I want to attack Player 2, and I want to get a confirmation

  scenario 'allow user 1 to see confirmation of attack' do
    sign_in_and_play
    click_link('Attack')
    expect(page).to have_content("Dave attacked Marco")
  end

  scenario 'allow user 2 to see confirmation of attack' do
    sign_in_and_play
    click_link('Attack')
    click_link('Switch Turn')
    click_link('Attack')
    expect(page).to have_content("Marco attacked Dave")
  end

  # As Player 1,
  # So I can start to win a game of Battle,
  # I want my attack to reduce Player 2's HP

  scenario 'allows an attack to reduce player 1s HP' do
    sign_in_and_play
    click_link('Attack')
    click_link('Switch Turn')
    expect(page).not_to have_content("Marco: 60 HP")
    expect(page).to have_content("Marco: 50 HP")

  end

   scenario 'allows an attack to reduce player 2s HP' do
    sign_in_and_play
    click_link('Attack')
    click_link('Switch Turn')
    click_link('Attack')
    click_link('Switch Turn')
    expect(page).not_to have_content("Dave: 60 HP")
    expect(page).to have_content("Dave: 50 HP")

  end
# As a Player,
# So I can Lose a game of Battle,
# I want to see a 'Lose' message if I reach 0HP first

  scenario 'allows a player to lose if hitpoints = 0 ' do
   sign_in_and_play
   11.times do
    click_link('Attack')
    click_link('Switch Turn')
    end
    expect(page).to have_content("Dave Wins!")
  end


end
