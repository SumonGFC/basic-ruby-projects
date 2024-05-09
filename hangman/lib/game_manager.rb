# frozen_string_literal: true

require 'msgpack'
require 'yaml'

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
    puts @state.display_arr.join(' ') << "  Tries Left: #{@state.tries_left}   Used: #{@state.guess_list}"
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
    if text.match?(/^[a-z]$/)
      @state.update(text)
    elsif text.match?(/^[a-z]{#{@state.length}}$/)
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


















# Manage state
class StateManager
  attr_reader :word, :length, :guess_list, :tries_left, :display_arr

  def initialize(word)
    @word = word
    @length = word.length
    @guess_list = []
    @tries_left = 6
    @display_arr = Array.new(@length, '_')
  end

  def update_guess_list(str)
    @guess_list.push(str)
  end

  def dec_tries
    @tries_left -= 1
  end

  def update(guess)
    dec_tries
    if guess.length == 1
      update_display_arr(guess)
      update_guess_list(guess)
    else
      test_word
    end
  end

  def update_display_arr(letter)
    @display_arr.each_index { @display_arr[i] = letter if @word[i] == letter }
  end

  def save
    file = File.expand_path('../save-data/data.txt', __dir__)
    data = YAML.dump(
      {
        word: @word,
        length: @length,
        guess_list: @guess_list,
        tries_left: @tries_left,
        display_arr: @display_arr
      }
    )
    File.write(file, data)
  end

  def load
    file = File.expand_path('../save-data/data.txt', __dir__)
    data = File.read(file)
    data = YAML.load(data)
    load_game(data)
  end

  def load_game(data)
    @word = data[:word]
    @length = data[:length]
    @guess_list = data[:guess_list]
    @tries_left = data[:tries_left]
    @display_arr = data[:display_arr]
  end
end

# Testing

GameManager.play_game
