# Define a recursive function that finds the factorial of a number.
def factorial(x, accumulator = 1)
  # Tail recursive
  if x.zero?
    accumulator
  else
    factorial(x - 1, x * accumulator)
  end
end

# Define a recursive function that returns true if a string is a palindrome and
# false otherwise.
def palindrome?(str)
  if str.empty?
    true
  else
    return palindrome?(str[1...-1]) if str[0] == str[-1]

    false
  end
end

# Define a recursive function that takes an argument n and prints "n bottles of
# beer on the wall", "(n-1) bottles of beer on the wall", ..., "no more bottles
# of beer on the wall".
def how_many_bottles(n)
  if n.zero?
    puts 'no more bottles of beer on the wall :('
  else
    puts "#{n} bottles of beer on the wall"
    how_many_bottles(n - 1)
  end
end

# Define a recursive function that takes an argument n and returns the
# fibonacci value of that position. The fibonacci sequence is 0, 1, 1, 2, 3, 5,
# 8, 13, 21... So fib(5) should return 5 and fib(6) should return 8.
def fibonacci(n)
  if n.zero?
    fib = 0
  elsif n == 1
    fib = 1
  else
    fib = fibonacci(n - 1) + fibonacci(n - 2)
  end
  fib
end

# Now write a function that returns an array of the first n fibonacci numbners
def fibs(n, accum = [0, 1])
  return accum if n <= 2

  accum << accum[-1] + accum[-2]
  fibs(n - 1, accum)
end

# Define a recursive function that flattens an array. The method should convert
# [[1, 2], [3, 4]] to [1, 2, 3, 4] and [[1, [8, 9]], [3, 4]]
# to [1, 8, 9, 3, 4].
def flatten_arr(arr)
  flattened = []
  arr.each do |x|
    if x.is_a? Integer
      flattened << x
    else
      flattened += flatten_arr(x)
    end
  end
  flattened
end

# Use the roman_mapping hash to define a recursive method that converts an
# integer to a Roman numeral.

roman_mapping = {
  1000 => 'M',
  900 => 'CM',
  500 => 'D',
  400 => 'CD',
  100 => 'C',
  90 => 'XC',
  50 => 'L',
  40 => 'XL',
  10 => 'X',
  9 => 'IX',
  5 => 'V',
  4 => 'IV',
  1 => 'I'
}

def int_to_roman(roman_mapping, number, result = '')
  return result if number.zero?

  roman_mapping.each_key do |k|
    q, r = number.divmod(k)
    result << roman_mapping[k] * q
    return int_to_roman(roman_mapping, r, result) if q.positive?
  end
end

# Project Euler Problem 1: Multiples of 3 and 5
# Find the sum of all multiples of 3 or 5 below 1000
def three_or_five(num, accum = 0)
  x = ((num - 1) / 3)
  y = ((num - 1) / 5)
  z = ((num - 1) / 15)
  x.times { |i| accum += 3 * (i + 1) }
  y.times { |i| accum += 5 * (i + 1) }
  z.times { |i| accum -= 15 * (i + 1) }
  accum
  # Alternatively, by direct computation:
  # accum = 3 * (0.5 * 333 * 334) + 5 * (0.5 * 199 * 200) - 15 * (0.5 * 66 * 67)
end

def sum_of_threes(num, iter = 1, accum = 0)
  return accum if iter > ((num - 1) / 3)

  sum_of_threes(num, iter + 1, accum += 3 * iter)
end

def sum_of_fives(num, iter = 1, accum = 0)
  return accum if iter > ((num - 1) / 5)

  sum_of_fives(num, iter + 1, accum += 5 * iter)
end

def filter_fifteens(num, iter = 1, accum = 0)
  return accum if iter > ((num - 1) / 15)

  filter_fifteens(num, iter + 1, accum -= 15 * iter)
end

def project_euler_1_recursive(num)
  result = sum_of_threes(num)
  result = sum_of_fives(num, 1, result)
  result = filter_fifteens(num, 1, result)
  result
end
