# Bubble Sort

=begin

input: array of 2 or more elements
output: array of 2 or mor elements, (same array)

Rules:
1. Must use bubble sort
2. Solution must be scaleable
3. Solution must work for either integer arrays or string arrays

Problem:
1. How to perform bubble sort?
  1. Have to be able to iterate through the method
    - Continuously
    - Break condition is if no changes are made
    - Two level loop should be used
      1. Representing full loops through the array
        Breaks if tally variable still 0 by end
        Resets tally variable to 0 at beginning
          2. Representing individual elements in the array
            Takes two elements at a time (1,2 ; 2,3 ; 3,4 ; 4,5)
            Compares elements
            Performs mutation to swap element places if necessary
            breaks if just worked with final index element

  Bubble Sort
    loop start
      tally = 0
      first = 0
      second = 1
      loop start
        case array[first] <=> array[second]
        when 1 then array[first], array[second] = array[second], array[first]
        end
        first += 1
        second += 1
        break if second == array.size
      end

      break if tally == 0
    end
  end

Mental Model:

=end

def bubble_sort!(array)
  loop do
    tally = 0
    first = 0
    second = 1
    until second == array.size
      if (array[first] <=> array[second]) == 1
        array[first], array[second] = array[second], array[first]
        tally += 1
      end
      first += 1
      second += 1
    end

    break if tally == 0
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
