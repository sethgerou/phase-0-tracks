# Release 0
# code to search an array for an integer, and return index of integer in array.

def search_array(array, integer)
  index = 0
  result = nil # variable to store result

      array.each do |number| # for each item in the array, check whether it is equal to the integer.
        if number == integer
          result = index # save current index as result when integer is found in array.
          break
        end
          index += 1 # each time the number does not match, increment the index.
      end
  return result
end

array = [3, 5, 7 , 10, 5 , 24 , 15, 14] # array to search

puts "please enter a number to find the index of."
integer = gets.chomp.to_i # ask user for an integer.

puts "The index of #{integer} in the array is: #{search_array(array, integer)}"

# Release 1
# code to print fibonacci number at user requested number of digits

def fib(number)
  sequence = [0,1]
  number.times {sequence << sequence[-1] + sequence[-2]}
  sequence[-1]
  return sequence
end

puts "Which Fibonacci number would you like?"
user_number = gets.chomp.to_i

puts "The Fibonacci sequence to #{user_number} is #{fib(user_number - 2)}"

puts fib(100-2)[99] == 218922995834555169026 # test for expected result

# Release 2 - 4.

# Pseudocode for sorting method.
# Accepts an array of integers
# Returns a sorted version of the array.

# determine the length of the array
# set variable for array length (-1 to account for 0 index)

# initialize loop condition false

# iterate through the array
# when value of first index is larger than value of next index, swap values so smaller number is before larger number.
# set loop condition true

# if loop condition is still false - end loop

# return sorted array

# Release 2 - 5.
# bubble sort implementation
arr = [32, 12, 23, 45, 5, 10, 1]

def bubble_sort(arr)
  arr_len = (arr.length) -1

loop do
  swapped = false

  arr_len.times do |index|
    if arr[index] > arr[index + 1]
      arr[index], arr[index + 1] = arr[index+1], arr[index]
      swapped = true
    end
  end
    break if swapped == false
end
  arr
end

puts bubble_sort(arr)
