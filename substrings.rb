# Implement method #substrings: 
# input: str, array of strs.
# return: hash listing the indices of each substring that was found

def substrings(str, substr_arr)
  result = {}

  substr_arr.each do |substr|
    indices = []
    match_pos = str.index(substr, 0)
    while !match_pos.nil?
      indices.push(match_pos)
      match_pos = str.index(substr, match_pos + 1)
    end
    result[substr] = indices unless indices.empty?
  end
  return result
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

x = substrings("below logogogoingwlhowdy low", dictionary)

p x
