test = "2 4 7 8 10"

def iq_test(numbers)
    array = numbers.split(" ")
    int_array = array.map(&:to_i)
    even_check = int_array.partition { |x| x.even?}
    if even_check[0].length == 1
        output = int_array.index {|x| x.even?}
    elsif
        output = int_array.index {|x| x.odd?}
    end
    return output + 1
end
puts iq_test(test)