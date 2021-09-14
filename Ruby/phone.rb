
def validPhoneNumber(phoneNumber)
    chars = phoneNumber.chars
    return false if chars.length != 14
    return false if chars[0] != "("
    return false if chars[4] != ")"
    return false if chars[5] != " "
    return false if chars[9] != "-"

    (1..3).each do |num|
        return false if not_a_digit(chars[num])
        # if chars[num].ord < 48 || chars[num].ord > 57
        #     return false
        # end
    end

    (6..8).each do |num|
        return false if not_a_digit(chars[num])
    end

    (10..13).each do |num|
        return false if not_a_digit(chars[num])
    end

    return true
end

def not_a_digit(string)
    string.ord < 48 || string.ord > 57
end

# puts not_a_digit("t")
# puts validPhoneNumber("(123) 456-7890")


# from codewars

def validPhoneNumber(number)
    phone = "(000) 000-0000"
    test = number.gsub(/[123456789]/, '0') 
    phone == test
end

puts validPhoneNumber("(123) 456-7890abc")