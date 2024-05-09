# frozen_string_literal: true

require 'msgpack'
require_relative './state_manager'
require_relative './helpers'

# Manage Game Logic
class GameManager
  include Helpers

  attr_reader :state

  def initialize
    @state = StateManager.new(load_word)
  end

  def self.play_game
    game = GameManager.new
    game.display_state
    puts game.state.word
    guess = game.get_input
    game.process_input(guess) if game.valid_input?(guess)
    puts game.state.word
    game.display_state
  end

  # GAME DISPLAY
  def display_state
    puts "\n#{@state.display_arr.join(' ')} \
      Tries Left: #{@state.tries_left} \
      Used: #{@state.guess_list}\n\n"
  end

  # USER INPUT
  def valid_input?(text)
    !already_guessed?(text, @state.guess_list) &&
      (user_cmd?(text) || word?(text, @state.length) || letter?(text))
  end

  # UPDATE STATE
  def process_input(text)
    if user_cmd?(text)
      process_user_cmd(text)
    else
      @state.update_state(text, text.length)
    end
  end

  def process_user_cmd(text)
    case text
    when 'save game'
      @state.save_game
    when 'load game'
      @state.load_game
    when 'exit game'
      exit_game
    end
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
