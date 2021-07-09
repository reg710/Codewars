# som = length + (sum of character values)
# test_names = "COLIN,MAANDBA,AMANDAB,CAROL,PauL,JOSEPH"
# test_weights = [1, 4, 4, 5, 2, 1]
# test_n_rank = 4

# Need to re-add capital letter to name in response
# Need to add in conditionals for failing


test_names = "Addison,Jayden,Sofia,Michael,Andrew,Lily,Benjamin"
test_weights = [4, 2, 1, 4, 3, 1, 2]
test_n_rank = 4

def rank(names, weights, n_rank)
    name_array = names.downcase.split(",")
    winning_numbers = []
    (0...name_array.length).each do |position|
        letter_value_array = name_array[position].bytes.map {|b| b - 96}    #finds the value of each letter in the name
        som = name_array[position].length + letter_value_array.sum          #adds the length of the name to the sum of the letter values of the name
        winning_numbers << [som * weights[position], name_array[position]]  # creates new array with number and name linked together in each position
    end
    # ordered_list = winning_numbers.sort_by{|a| a.first}.reverse             #sorts in descending order, then alphabetically (only not really)
    winner = ordered_list[n_rank - 1][1]
    return winner

end

puts rank(test_names, test_weights, test_n_rank)