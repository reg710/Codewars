# https://www.codewars.com/kata/520b9d2ad5c005041100000f/train/ruby

def pig_it(text)
    output = []
    suffix = "ay"
    array = text.split(" ")
    array.each do |word|
        # Using regex to check for punctuation. This only works if 'text' always separates them with spaces
        if /[[:punct:]]/.match(word) == nil              
            output << word[1..-1] + word[0] + suffix     # Using range to get letters in pig latin order
        elsif
            output << word                               # Keeps punctuation in place
        end
    end
    return output.join(" ")
end

test = 'Hello world !'

puts pig_it(test)