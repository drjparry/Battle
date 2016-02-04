require 'selenium-webdriver'
require 'capybara/dsl'

feature "User Story => Battle" do

  def firefox
    include Capybara::DSL
    Capybara.default_driver = :selenium
  end

  # As Player 1,
  # So I can see how close I am to winning
  # I want to see Player 2's Hit Points
  scenario "allows user to see player 2's hitpoints" do
    # firefox
    sign_in_and_play
    expect(page).to have_content("Barry: 60/60 HP")
  end

# As Player 1,
# So I can win a game of Battle,
# I want to attack Player 2, and I want to get a confirmation

  scenario 'allow user to see confirmation of attack' do
    sign_in_and_play
    click_link('Attack')
    expect(page).to have_content("Dave attacked Barry")
  end

end
