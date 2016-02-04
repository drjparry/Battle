def sign_in_and_play
    visit '/'
    fill_in('player1', with: 'Dave')
    fill_in('player2', with: 'Barry')
    click_button('Submit')
end
