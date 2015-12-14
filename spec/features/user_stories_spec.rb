require 'spec_helper'

describe 'User Stories' do

	feature 'enter name' do
		scenario 'submitting name' do
			visit '/'
			fill_in :name, with: 'Dave'
			click_button 'submit'
			expect(page).to have_content 'Your name is Dave'
		end
	end

	# 	As a marketeer
	# So that I can see my name in lights
	# I would like to register my name before playing an online game

	before do
		visit '/'
		fill_in :name, with: 'Dave'
		click_button 'submit'
	end

	 feature 'playing a game' do
		 PLAY_SEED = 221563
		 scenario 'see the shape options' do
			 expect(page).to have_button 'Rock'
			 expect(page).to have_button 'Paper'
			 expect(page).to have_button 'Scissors'
		 end


		scenario 'choose a shape' do
			click_button 'Rock'
			expect(page).to have_content 'You chose Rock!'
		end

		scenario 'game chooses "rock"' do
			click_button 'Rock'

			message = find(:css, "#opponent").text

			expect(possible_messages).to include message
		end

		#Game chooses a random action

		scenario 'game chooses a random option' do
			srand(PLAY_SEED)
			click_button 'Rock'
			expect(page).to have_content 'Opponent chose Scissors'
		end

		def possible_messages
			[:rock, :paper, :scissors].map { |shape| "Opponent chose #{shape.to_s.capitalize}!" }
		end

	end
end
# As a marketeer
# So that I can enjoy myself away from the daily grind
# I would like to be able to play rock/paper/scissors
