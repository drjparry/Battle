require 'selenium-webdriver'
require 'capybara/dsl'

feature "User Story => Battle" do


  # As two Players,
  # So we can play a personalised game of Battle,
  # We want to Start a fight by entering our names and seeing them
  scenario "allow players entering their names" do
    sign_in_and_play
    expect(page).to have_content("Dave vs. Marco")
  end
end
