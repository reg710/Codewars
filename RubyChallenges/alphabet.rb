sample = ["abode","ABc","xyzD"]
checking = ["abide","ABc","xyz"]

# separate array into words, then into letters
# find out letter's position in the alphabet
# find letter's index in the word
# if those are equal, add to counter

def solve(arr)
    letter_key = ('a'..'z')
    output = []
    arr.each do |word|
        sum = 0
        letters = word.downcase.split('')
        letters.each_with_index do |letter, index|
            alphabet_position = letter_key.find_index(letter)
            if index == alphabet_position
                sum += 1
            end
        end
        output << sum
    end
    return output     
end


puts solve(sample)