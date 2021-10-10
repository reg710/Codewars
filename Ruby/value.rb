# https://www.codewars.com/kata/5840586b5225616069000001/train/ruby

def highest_value(a, b)
    # Create an array of ascii numbers and add them together
    a_value = a.bytes.sum
    b_value = b.bytes.sum

    # If the b value is greater, return b. Otherwise return a. 
    # This also covers cases where they are equal
    b_value > a_value ? b : a

    # if b_value > a_value
    #     return b
    # else
    #     return a
    # end
end




