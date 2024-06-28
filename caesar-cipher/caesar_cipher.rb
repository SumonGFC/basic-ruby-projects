# Basic Caesar Cipher program
# Accepts all strings and integer shift values
# Only rotates alphabetical characters

def ceasar_cipher(str, shift)
  encoded = str.codepoints.map { |val| rot_codepoint(val, shift).chr }
  encoded.join('')
end

def rot_codepoint(code, shift)
  raise ArgumentError unless code.is_a?(Integer) && shift.is_a?(Integer)

  # Negative shifts allowed
  shifted = code + (shift % 26)

  # Preserve case
  if code.between?(65, 90)
    shifted > 90 ? (return (shifted % 90) + 64) : (return shifted)
  elsif code.between?(97, 122)
    shifted > 122 ? (return (shifted % 122) + 96) : (return shifted)
  end

  # Leave non-alphabetical chars alone
  code
end

# loop do
#   puts 'Enter str'
#   x = gets.chomp
#   puts 'Enter shift'
#   y = gets.chomp.to_i
#   puts ceasar_cipher(x, y)
# end
