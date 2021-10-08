# https://www.codewars.com/kata/57f5e7bd60d0a0cfd900032d/train/ruby

def missing_no(nums)
    # sort the array
    sorted = nums.sort

    # use number range to check if it matches value in index of sorted array
    (0..100).each do |number|
        if number != sorted[number]
            return number
        end
    end
end



test = [0, 3, 5, 1, 2]
puts missing_no(test)


# from codewars

def missing_number(nums)
    return (0..100).sum - nums.sum
end

puts missing_number(test)
