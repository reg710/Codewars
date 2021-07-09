# https://www.codewars.com/kata/521c2db8ddc89b9b7a0000c1/train/ruby


test_array = [[1,2,3],
             [8,9,4],
             [7,6,5]]

def snail(array)
    output = []
    size = array.length
    top = 0
    right = size - 1
    bottom = size - 1
    left = 0
    direction = "rightwards"

    while (left <= right && top <= bottom)
        if direction == "rightwards"
            (top..right).each do |num|
                output << array[top][num]
            end
            top += 1
            direction = "downwards" 

        elsif direction == "downwards"
            (top..bottom).each do |num|
                output << array[num][right]
            end
            right -= 1
            direction = "leftwards"

        elsif direction == "leftwards"
            (right).downto(left).each do |num|
                output << array[bottom][num]
            end
            bottom -= 1
            direction = "upwards"

        elsif direction == "upwards"
            bottom.downto(top).each do |num|
                output << array[num][left]
            end
            left +=1 
            direction = "rightwards"
        end
    end
    array == [[]] ? [] : output
end

puts snail(test_array)


# from codewars

def snail(array)
    result = []
    while array.flatten.any?
      result << array.shift
      array = array.transpose.reverse
    end
    result.flatten
end