# In a stinrg of just words and spaces, 
# reverse letters for words that are five letters or more

input = "Hello fellow warriors"

input_array = input.split()
reversified = []

input_array.each do |word|
    if word.length >= 5
        reversified << word.reverse
    else
        reversified << word
    end
end

puts reversified.join(' ')