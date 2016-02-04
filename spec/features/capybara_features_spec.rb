require 'selenium-webdriver'
require 'capybara/dsl'

feature "User Story => Battle" do

  def firefox
    include Capybara::DSL
    Capybara.default_driver = :selenium
  end

  # As two Players,
  # So we can play a personalised game of Battle,
  # We want to Start a fight by entering our names and seeing them
  scenario "allow players entering their names" do

    visit '/'
    fill_in('player1', with: 'David')
    fill_in('player2', with: 'Barry')
    click_button('Submit')
    expect(page).to have_content("David vs. Barry")
  end

  # As Player 1,
  # So I can see how close I am to winning
  # I want to see Player 2's Hit Points
  scenario "allows user to see player 2's hitpoints" do
    # firefox
    visit '/'
    fill_in('player1', with: 'David')
    fill_in('player2', with: 'Barry')
    click_button('Submit')
    expect(page).to have_content("Barry: 60/60 HP")
  end
end
