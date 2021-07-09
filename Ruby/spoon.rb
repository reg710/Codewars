words = "not picking"

spoon1 = []
spoon2 = []

words_array = words.split()

# Shovels the first letter of the other word
## The first box references the word in that array location
## The second box references the letter location of the word found in the array position named in the first box
# Shovels all remaining letters, after the first letter, of the original word
## Have to use words_array[].length, if you do words_array.length it will just return 2 letters of second word
spoon1 << words_array[1][0]
spoon1 << words_array[0][1..words_array[0].length]

spoon2 << words_array[0][0]
spoon2 << words_array[1][1..words_array[1].length]

#joins the arrays to print as spoonified string
spoonerism = "#{spoon1.join} #{spoon2.join}"

puts spoonerism

