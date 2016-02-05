feature 'Switch turns' do
  scenario 'allows players to change turn' do
    sign_in_and_play
    click_link('Attack')
    click_link('Switch Turn')
    expect(page).to have_content "Current Turn: Marco"
  end
end