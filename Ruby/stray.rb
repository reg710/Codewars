# https://www.codewars.com/kata/57f609022f4d534f05000024

def stray (numbers)
    if numbers.count(numbers.first) == 1
        return numbers.first
    else
        numbers.select { |stray| stray != numbers.first }.join.to_i
    end
end


test = [1, 1, 3]

puts stray(test)


# from codewars

def stray (numbers)
    numbers.find { |n| numbers.one? n }
end