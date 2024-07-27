# implement method #stock_picker
# input: Array of closing prices -- arbitrary length
# return: best day to buy, best day to sell
# Must buy before we can sell. If the closing prices consecutively decrease,
# return nil. Assume each value in array is unique.

def stock_picker(closing_prices)
  min = [closing_prices[0], 0]
  max = [closing_prices[0], 0]
  best_days = { buy: 0, sell: 0, diff: 0 }

  closing_prices.each_with_index do |price, i|
    min = [price, i] if price < min[0]
    max = [price, i] if price > min[0]
    next unless max[0] - min[0] > best_days[:diff] && min[1] < max[1]

    best_days[:buy] = min[1]
    best_days[:sell] = max[1]
    best_days[:diff] = max[0] - min[0]
  end
  best_days
end

p test1 = Array.new(10) { rand(1..10) }
p stock_picker(test1)
