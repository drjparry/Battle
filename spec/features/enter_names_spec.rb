require 'capybara/dsl'
require 'selenium-webdriver'




feature 'Enter names' do

  def visual
    include Capybara::DSL
  Capybara.default_driver = :selenium

end

  scenario 'submitting names' do
    visual
    visit('/')
    fill_in :player_1_name, with: 'Godfrey'
    fill_in :player_2_name, with: 'Fareed'
    click_button 'Submit'
    expect(page).to have_content 'Dave vs. Fareed'
  end
end