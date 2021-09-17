# https://leetcode.com/problems/reverse-integer/

def reverse(x)
    sign = ""
    numbers = x.to_s.chars
    if numbers.first == "-"
        sign = numbers.shift
    end
    reversed = numbers.reverse
    answer = "#{sign}#{reversed.join}"
    answer = answer.to_i

    # This is checking if the number is more or less than 32 bit
    if answer > 2147483647 || answer < -2147483648 
        return 0
    else
        return answer
    end
    
end

test = -1230

puts reverse(test)

# javascript solution

const reverse = x => {
    const limit = 2147483648;
    const k = x < 0 ? -1 : 1;
    const n = Number(String(Math.abs(x)).split('').reverse().join(''));
    return n > limit ? 0 : n * k;
};