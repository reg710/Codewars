# https://leetcode.com/problems/palindrome-number/

def is_palindrome(x)
    string = x.to_s
    string == string.reverse
end

puts is_palindrome(121)
puts is_palindrome(-121)
puts is_palindrome(10)
