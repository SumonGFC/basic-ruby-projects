# Basic Caesar Cipher program
# Accepts all strings and integer shift values
# Only rotates alphabetical characters

def ceasar_cipher(str, shift)
  shift = shift % 26    # negative rots allowed
  codepoints = str.codepoints
  codepoints.map! { |val| rot_codepoint(val, shift).chr }
  return codepoints.join("")
end

def rot_codepoint(code, shift)
  if code.between?(65,90)
    code > 90 ? (return (code+shift) % 90 + 64) : (return code + shift)
  elsif code.between?(97,122)
    code > 122 ? (return (code + shift) % 122 + 96) : (return code + shift)
  end
  return code   # leave non-alphabetical chars alone
end

loop do
  puts "Enter str"
  x = gets.chomp
  puts "Enter shift"
  y = (gets.chomp).to_i
  puts ceasar_cipher(x, y)
end
