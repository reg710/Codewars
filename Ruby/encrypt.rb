# https://www.codewars.com/kata/5848565e273af816fb000449


test = "h"
def encrypt_this(text)
    output = []
    words = text.split()
    words.each do |word|
        letters = word.split(//)
        letters[0] = letters[0].ord
        temp = letters[1]
        letters[1] = letters[-1]
        letters[-1] = temp
        output << letters
    end
    return output.join(" ")
end

puts encrypt_this(test)


# codewars solutions

def encrypt_this(text)
    text.split.map do |word|
        characters     = word.split('')
        characters[0]  = characters[0].ord
        swap           = characters[1]
        characters[1]  = characters[-1]
        characters[-1] = swap
        characters.join
      end.join(' ')
end

def encrypt_this(text)
    text.split.map { |word|
      word[1], word[-1] = word[-1], word[1] if word.size > 2
      word[0] = word[0].ord.to_s
      word
    } .join(' ')
end