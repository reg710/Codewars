# Change the bool at the start of the while loop in order to check whether the index's in the array ever enter the inner if statement.
# If there are no more directions to delete (the if statement isn't entered) then this will break the loop at the right time.
# Loop through the range of the array, set to minus 2 because you won't need to check to the right of the last index in the array
# each_with_index allows you to compare items in the array, as well as remove items by specifiying their index in the array
    #Since I was sorting through a range, not the array itself, I was able to change back to just using an each loop
# Didn't realize that with each_with_index you could still use +1 on the items to compare items but it works
    # Was misunderstanding how this worked-it was because I was sorting through a range so it was still returning a number not the string
# If you just used delete_at without index, it would delete all the "North" in the array (for ex) rather than just the one you want
# When you delete_at(index), everything else in the array will move left, which is why the delete +1 had to come first
    # Or you could just delete at index twice instead, same thing


test_array = ["NORTH", "WEST", "SOUTH", "NORTH", "EAST", "NORTH"]
test_array_second = ["NORTH", "SOUTH", "NORTH", "EAST", "SOUTH"]

def streamline_direction(directions)
    looping = true
    while looping
        
        looping = false

        (0..(directions.length - 2)).each do |index|
            if (directions[index] == "NORTH" && directions[index + 1] == "SOUTH") ||
                (directions[index] == "SOUTH" && directions[index + 1] == "NORTH") || 
                (directions[index] == "EAST" && directions[index + 1] == "WEST") ||
                (directions[index] == "WEST" && directions[index + 1] == "EAST")
                
                looping = true
                directions.delete_at(index + 1)
                directions.delete_at(index)               
            end
        end
    end
    return directions
end

puts streamline_directions(test_array)
puts streamline_directions(test_array_second)
