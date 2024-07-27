require 'benchmark'

def merge_sort(arr, len)
  return arr.sort if arr.length <= len

  mid = ((arr.length) / 2).floor
  left = merge_sort(arr[0...mid], len)
  right = merge_sort(arr[mid..], len)
  merge(left, right)
end

def merge(arr1, arr2)
  merged = []
  total_len = arr1.length + arr2.length
  until merged.length == total_len
    if arr2.empty?
      merged.push(*arr1)
    elsif arr1.empty?
      merged.push(*arr2)
    elsif arr1.first < arr2.first
      merged.push(arr1.shift)
    elsif arr2.first <= arr1.first
      merged.push(arr2.shift)
    end
  end

  merged
end

# test1 = Array.new(1_000_000) { |i| i = rand(0..100) }
# test2 = Array.new(2_000_000) { |i| i = rand(0..100) }
# test3 = Array.new(3_000_000) { |i| i = rand(0..100) }

# Benchmark.bm(5) do |x|
#   x.report('1mil, 500:') { merge_sort(test1, 500) }
#   x.report('1mil, 600:') { merge_sort(test1, 600) }
#   x.report('1mil, 700:') { merge_sort(test1, 700) }
#   x.report('1mil, 800:') { merge_sort(test1, 800) }
#   x.report('1mil, 900:') { merge_sort(test1, 900) }
#   x.report('1mil, 1000:') { merge_sort(test1, 1000) }
# end
p merge_sort([], 1)
p merge_sort([1, 2, 3, 4, 5], 1)
p merge_sort([10, 9, 8, 7, 6, 5, 4, 3, 2, 1], 1)
p merge_sort([0], 1)
p merge_sort([0, 0, 0, 0], 1)
