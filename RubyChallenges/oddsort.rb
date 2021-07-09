# https://www.codewars.com/kata/578aa45ee9fd15ff4600090d/ruby

test = []

def sort_array(source_array)
    odds_array = source_array.select(&:odd?).sort
    odds_index = 0
    source_array.each_with_index do |number, index|
        if number.odd?
            source_array[index] = odds_array[odds_index]
            odds_index += 1
        end
    end
    return source_array
end

puts sort_array(test)

# from codewars

def sort_array(source_array)
    odds = source_array.select(&:odd?).sort
    source_array.map { |n| n.even? ? n : odds.shift }
end