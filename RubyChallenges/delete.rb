# https://www.codewars.com/kata/5727bb0fe81185ae62000ae3/train/ruby
# if only # are left, return empty string
# if given empty string, return empty string

test = "abc##d######"


def clean_string(string)
    output = []
    letters = string.split(//)
    letters.each do |letter|
        if letter != "#"
            output << letter
        else
            output.pop
        end
    end
    return output.join()

    
end

puts clean_string(test)


# from codewars

def clean_string(str)
    str.chars.each_with_object([]) { |ch, o| ch == "#" ? o.pop : o << ch }.join
end
  