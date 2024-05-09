# frozen_string_literal: true

require 'yaml'

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

  def load
    file = File.expand_path('../save-data/data.yml', __dir__)
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
