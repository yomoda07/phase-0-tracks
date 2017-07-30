#Release 0

arr = [2, 34, 63, 23, 3]

def search_array(arr, number)
  counter = 0
  arr.each do |value|
   return counter if value == number
   counter += 1
  end
  nil
end

p search_array(arr, 63)

#Release 1-------------------------

def fib(number)
  arr = [0,1,1]
  until arr.length == number 
    arr << arr[-1] + arr[-2]
  end
  arr
end

p fib(100)


#Release 2---------------------------

#take an array as an argument
#until numbers on the ledt are all less than numbers to their right
#start from left compare each number with the number to the right until the number on the left is greater than on the right
#update the array to switch those two numbers
#return array

def bubblesort(arr)
  result = false
  until result == true
    result = true
    arr.length.times do |index| 
      if index != arr.length - 1 
        if arr[index] > arr[index + 1]
          arr[index], arr[index + 1] = arr[index + 1], arr[index]
          result = false
        end 
      end
    end
  end
  puts arr
end



example_array = [1, 2, 4, 6, 5, 3]

bubblesort(example_array)