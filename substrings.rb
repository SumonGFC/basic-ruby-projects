# Implement method #substrings: 
# input: str, array of strs.
# return: hash listing the indices of each substring that was found; case sensitive

def substrings(str, substr_arr)
  result = {}

  substr_arr.each do |substr| #for each word in the dictionary
    indices = []
    match_pos = str.index(substr, 0)  #find index of first match of substr in the string we are testing
    while !match_pos.nil? # str.index will return nil if no matches found
      indices.push(match_pos) # push index of the match
      match_pos = str.index(substr, match_pos + 1)  #get index of next match, starting from after the previous match
    end
    result[substr] = indices unless indices.empty?  #the length of indices array is the number of matches found
  end
  return result
end


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

x = substrings("below logogogoingwlhowdy low", dictionary)

p x
