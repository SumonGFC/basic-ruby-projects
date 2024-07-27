# Implement method #substrings:
# input: str, array of strs.
# return: hash listing the indices of each substring that was found; case sensitive

def substrings(str, substr_arr)
  result = {}

  substr_arr.each do |substr|
    indices = []
    # find index of first match of substr in the string we are testing
    match_pos = str.index(substr, 0)
    # str.index will return nil if no matches found
    until match_pos.nil?
      # push index of the match
      indices.push(match_pos)
      # get index of next match, starting from after the previous match
      match_pos = str.index(substr, match_pos + 1)
    end
    result[substr] = indices unless indices.empty?
  end
  result
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]

x = substrings('below logogogoingwlhowdy low', dictionary)

p x
