# frozen_string_literal: true

require 'yaml'

# Manage state
class StateManager
  attr_reader :word, :length, :guess_list, :tries_left, :display_arr

  def initialize(word)
    @word = word
    @length = word.length
    @guess_list = []
    @tries_left = 2 * @word.chars.uniq.length
    @display_arr = Array.new(@length, '_')
  end

  def update_state(guess, word_length)
    dec_tries
    push_guess(guess)
    update_display_arr(guess) if word_length == 1
  end

  def push_guess(str)
    @guess_list.push(str)
  end

  def dec_tries
    @tries_left -= 1
  end

  def update_display_arr(letter)
    @display_arr.each_index do |i|
      @display_arr[i] = letter if @word[i] == letter
    end
  end

  def save_game
    file = File.expand_path('../save-data/data.yml', __dir__)
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

  def load_game
    file = File.expand_path('../save-data/data.yml', __dir__)
    data = YAML.load(File.read(file))
    load_game_data(data)
  end

  def load_game_data(data)
    @word = data[:word]
    @length = data[:length]
    @guess_list = data[:guess_list]
    @tries_left = data[:tries_left]
    @display_arr = data[:display_arr]
  end
end
