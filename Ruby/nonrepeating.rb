# https://www.codewars.com/kata/52bc74d4ac05d0945d00054e/train/ruby
# Is there a way to avoid counting characters you already know have more than one?

def  first_non_repeating_letter(s) 
    s_arr = s.chars
    answer_index = ""
    letters = s.downcase.chars
    letters.each do |char|
        if letters.count(char) == 1
            answer_index = letters.index(char)
            break
        end
    end
    
    return answer_index == "" ? answer_index : s_arr[answer_index]
    
end

test = "at"

puts first_non_repeating_letter(test)