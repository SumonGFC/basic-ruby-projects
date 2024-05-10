# frozen_string_literal: true

require 'msgpack'

# Helper functions for GameManager
module Helpers
  def load_word
    file = File.expand_path('../words.txt', __dir__)
    MessagePack.load(File.read(file)).sample
  end

  def get_input
    gets.chomp.downcase
  end

  def letter?(text)
    text.match?(/^[a-z]$/)
  end

  def word?(text, word_length)
    text.match?(/^[a-z]{#{word_length}}$/)
  end

  def user_cmd?(text)
    ['save game', 'load game', 'exit game'].include?(text)
  end

  def already_guessed?(text, list)
    list.include?(text)
  end
end
