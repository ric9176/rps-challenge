require 'spec_helper'

# As a marketeer
# So that I can enjoy myself away from the daily grind
# I would like to be able to play rock/paper/scissors

feature 'playing a game' do
  before do
    visit '/'
    fill_in 'name', with: 'Richard'
    click_button 'Submit'
  end
  #Aa a marketer
  #so I can play a game
  #I want to see the shapes i can play

  scenario 'see the shape options' do
    expect(page).to have_button 'Rock'
    expect(page).to have_button 'Paper'
    expect(page).to have_button 'Scissors'
  end

  #As a marketeer
  #So I can play a game
  #I want to chose a shape to play
  scenario 'choose a shape' do
    click_button 'Rock'
    expect(page).to have_content 'You choose Rock'
  end
end
