# https://www.codewars.com/kata/545cedaa9943f7fe7b000048/train/ruby

def pangram?(string)
    alphabet = "abcdefghijklmnopqrstuvwxyz".split('')
    sentence = string.downcase
    letters = sentence.scan(/[a-z]/)
    alphabet == letters.uniq.sort
end

test = "This is not a pangram."
puts pangram?(test)


# from codewars

def panagram(string)
    string.downcase.scan(/[a-z]/).uniq.size == 26
end