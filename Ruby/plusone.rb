# https://www.codewars.com/kata/5514e5b77e6b2f38e0000ca9/train/ruby

def up_array(arr)
    return nil if arr.empty? || !arr.select {|x| x.negative?}.empty? || !arr.select {|x| x > 9}.empty?
    sum =  arr.join.to_i + 1
    return sum.to_s.split('').map(&:to_i)
end

test = [1, 2, 3]

puts up_array(test)


# from codewars
def up_array(arr)
    return nil if arr.empty? || arr.any? { |x| x < 0 || x > 9 }
    arr.join.next.chars.map(&:to_i)
end