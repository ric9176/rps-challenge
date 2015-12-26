require 'spec_helper'
PLAY_SEED = 221563
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

  #As a marketer
  #So I can play a game
  #I want the game to chosse an option

  scenario 'game chooses a random option' do
    srand(PLAY_SEED)
    click_button 'Rock'
    expect(page).to have_content 'Opponent chose Scissors!'
  end

  #As a marketeer
  #So I can play a game
  #I want to see if I win

context 'end game' do
    before do
      srand(PLAY_SEED)
    end

  scenario 'I win' do
    click_button 'Rock'
    expect(page).to have_content 'You win!'
  end

  scenario 'I lose' do
    click_button 'Paper'
    expect(page).to have_content 'You lose!'
  end

  scenario 'draw' do
    click_button 'Scissors'
    expect(page).to have_content 'You draw!'
  end
end

  def possible_messages
    [:rock, :paper, :scissors].map { |shape| "Opponent chose #{shape.to_s.capitalize}!" }
  end
end
