# frozen_string_literal: true
require 'msgpack'

words = File.readlines('ex-google-10000-english-no-swears.txt',
                       chomp: true,
                       autoclose: true)
words.keep_if { |word| word.length.between?(5, 12) }

def to_msgpack(data)
  MessagePack.dump(data)
end

def from_msgpack(data)
  MessagePack.load(data)
end

packed = to_msgpack(words)
File.write('words.txt', packed)
