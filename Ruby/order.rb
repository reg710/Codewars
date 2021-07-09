# https://www.codewars.com/kata/55c45be3b2079eccff00010f
# https://medium.com/@nothingisfunny/sorting-arrays-in-ruby-375c547a5d6

test = "is2 Thi1s T4est 3a"

def order(words)
    arr = words.split(' ')
    answer = arr.sort_by { |s| s.scan(/\d+/) }
    return answer.join(' ')
end


def ordering(words)
    arr = words.split(' ')
    answer = []
    count = 1

    while answer.length < arr.length
        arr.each do |word|
            if word.include?(count.to_s)
                answer << word
            end
        end
        count += 1
    end

    return answer.join(' ')
end

puts ordering(test)