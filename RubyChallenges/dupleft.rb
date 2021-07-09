# https://www.codewars.com/kata/5ba38ba180824a86850000f7/train/ruby 

test = [3, 4, 4, 3, 6, 3]

def solve arr 
    arr.reverse.uniq.reverse
end

puts solve(test)