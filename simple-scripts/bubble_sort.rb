def bubble_sort(arr)
  sorted = false
  while !sorted
    swapped = false
    (arr.length - 1).times do |i|
      if arr[i+1] < arr[i]
        arr[i], arr[i+1] = arr[i+1], arr[i]
        swapped = true
      end
    end
    sorted = true if swapped == false
  end
  return arr
end

x = [1,2,523,3,7,8,5,323,43,6,8,9,5,3,7,9,0]

p bubble_sort(x)
