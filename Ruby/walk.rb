def is_valid_walk(walk)
    #your code here
    if walk.length != 10
        output = false
    else
        if walk.count('n') == walk.count('s') && walk.count('e') == walk.count('w')
            output = true
        else
            output = false
        end
    end
    return output
end

valid_array = ['n','s','n','s','n','s','n','s','n','s']
not_valid_array = ['n','n','n','s','n','s','n','s','n','s']
# puts valid_array.length

# puts valid_array.count('n')

puts is_valid_walk(valid_array)
puts is_valid_walk(not_valid_array)