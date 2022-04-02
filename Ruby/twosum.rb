def two_sum(numbers, target)
    dictionary = {}
    numbers.each_with_index do |number, index|
        possible_match = target - number
        if dictionary.has_key?(possible_match)
            return [dictionary[possible_match], index]
        else
            dictionary[number] = index
        end
    end
    return []
end


test_array = [1, 2, 3]
target = 4
puts two_sum(test_array, target)