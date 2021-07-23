# https://www.codewars.com/kata/55c04b4cc56a697bb0000048/train/ruby
# unsolved

def scramble(s1,s2)
    if s2.length > s1.length
        return false
    end
    a1 = s1.split(//)
    a2 = s2.split(//)
    a2 - a1 == []

end
test1 = 'abb'
test2 = 'baa'

puts scramble(test1, test2)