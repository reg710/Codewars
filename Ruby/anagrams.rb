test_input = "abba"
test_array = ["aabb", "abcd", "bbaa", "dada"]

empty_test = "laser"
empty_array = ["lazing", "lazy", "lacer"]

def anagrams(input, words_array)
    sorted = input.split('').sort
    output = []
    words_array.each do |word|
        if sorted == word.split('').sort
            output << word
        end
    end
    return output
end

puts anagrams(test_input, test_array)


# solution from codewars

def anagrams(word, words)
    m = word.chars.sort
    words.select { |w| w.chars.sort == m }
end