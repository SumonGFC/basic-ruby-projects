# implement method #stock_picker
# input: Array of closing prices -- arbitrary length
# return: best day to buy, best day to sell
# Must buy before we can sell. If the closing prices consecutively decrease,
# return nil. Assume each value in array is unique.

def stock_picker(closing_prices)
  streak_indices = find_winning_streaks(closing_prices)
  gains = 0
  _start = 0
  _end = 0
  streak_indices.each do |val|
    high = closing_prices[val[1]]
    low = closing_prices[val[0]]
    if (high - low) > gains
      gains = high - low
      _start = val[0]
      _end = val[1]
    end
  end
  return {"gains": gains, "indices":[_start, _end]}
end

def find_winning_streaks(closing_prices)
  green_streaks = []
  i = 0
  increasing = false
  tmp_min = 0
  tmp_max = 0

  until i + 1 == closing_prices.length
    if closing_prices[i+1] - closing_prices[i] > 0 # increasing
      if increasing == false  # if previously decreasing
        tmp_min = i
        increasing = true
      else
        tmp_max = i
      end
    else  # decreasing or side-ways
      if increasing == true # if previously increasing
        tmp_max = i
        green_streaks.push([tmp_min, tmp_max])
        increasing = false
      end
    end
    i += 1
  end

  if closing_prices[tmp_min] < closing_prices[-1]
    green_streaks.push([tmp_min, closing_prices.length - 1])
  end
  p green_streaks
  return green_streaks
end


x = [17,3,6,9,15,8,6,1,10,1, 2,3,1, 100]

p stock_picker(x)
