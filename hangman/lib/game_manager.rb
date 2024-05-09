# frozen_string_literal: true

require 'msgpack'
require_relative './state_manager'

# Manage Game Logic
class GameManager
  attr_reader :state

  def initialize
    @state = StateManager.new(load_word)
  end

  def self.play_game
    game = GameManager.new
    game.display_state
    puts game.state.word
    guess = game.get_input
    if game.valid_input?(guess)
      game.process_input(guess)
    else
      puts 'Invalid Input'
    end
    game.display_state
  end

  # GAME INITIALIZATION

  def load_word
    MessagePack.load(File.read('words.txt')).sample
  end

  # GAME DISPLAY
  def display_state
    puts "#{@state.display_arr.join(' ')} \
      Tries Left: #{@state.tries_left} \
      Used: #{@state.guess_list}"
  end

  # USER INPUT
  def get_input
    gets.chomp.downcase
  end

  def valid_input?(text)
    !@state.guess_list.include?(text) &&
      (
        ['save game', 'load game', 'exit game'].include?(text) ||
        text.match?(/^[a-z]$/) ||
        text.match?(/^[a-z]{#{@state.length}}$/)
      )
  end

  # UPDATE STATE
  def process_input(text)
    if text.length == 1
      @state.update(text)
    elsif text.length == @state.length
      @state.test_word(text)
    elsif ['save game', 'load game', 'exit game'].include?(text)
      handle_user_cmd(text)
    end
  end

  def handle_user_cmd 
  end
  # CHECK GAME OVER
  
  # FINISH GAME
  def exit_game
    puts 'Thanks for playing!'
    exit
  end
end

# Testing

GameManager.play_game
