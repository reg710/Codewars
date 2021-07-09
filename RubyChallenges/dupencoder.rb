test_word = "recede"  
another_test_word = "(( @"


def duplicate_encode(word)
    output = []
    characters = word.downcase.split(//)
    characters.each do |x|
        if characters.count(x) == 1
            output << "("
        else
            output << ")"
        end
    end
    return output.join
end

puts duplicate_encode(another_test_word)