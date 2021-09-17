# https://leetcode.com/problems/roman-to-integer/

def roman_to_int(s)
    dictionary = {
        :I => 1,
        :V => 5,
        :X => 10,
        :L => 50,
        :C => 100,
        :D => 500,
        :M => 1000
    }

    output = []
    array = s.chars

    array.each_with_index do |symbol, index|
        current = dictionary.fetch(symbol.to_sym)
        if index + 1 < array.length
            if current < dictionary.fetch(array[index + 1].to_sym)
                current = -current
            end
        end
        output << current
    end
    return output.sum

end

puts roman_to_int("MCMXCIV")