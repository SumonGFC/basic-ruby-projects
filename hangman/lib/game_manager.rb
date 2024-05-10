# frozen_string_literal: true

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
    until game.game_over?
      game.display_state
      print 'Make your guess: '
      guess = game.get_input
      until game.valid_input?(guess)
        puts 'Invalid guess'
        print 'Make your guess: '
        guess = game.get_input
      end
      game.process_input(guess)
    end

    if game.game_won?
      puts "Congrats! You guessed the correct word: #{game.state.word}"
    else
      puts "You lose! The correct word was #{game.state.word}"
    end
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
      puts 'Game Saved!'
    when 'load game'
      @state.load_game
      puts 'Game Loaded!'
    when 'exit game'
      exit_game
    end
  end

  # CHECK GAME OVER
  def game_over?
    @state.tries_left.zero? || game_won?
  end

  def game_won?
    @state.display_arr.join('') == @state.word ||
      @state.guess_list.last == @state.word
  end

  # FINISH GAME
  def exit_game
    puts 'Thanks for playing!'
    exit
  end
end
