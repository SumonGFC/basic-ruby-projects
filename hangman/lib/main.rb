# frozen_string_literal: true

require_relative 'game_manager'
require_relative 'state_manager'

print('Wanna play Hangman? (y/n): ')
input = gets.chomp.downcase
while input == 'y'
  GameManager.play_game
  print 'Thanks for playing! Wanna play again? (y/n): '
  input = gets.chomp.downcase
end
