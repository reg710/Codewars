floors = 6

#you can look up .center or .rjust and that can center a string
def tower_builder(n_floors)
    star_count = []
    mountain_by_line = []
    mountain = []
    counter = 1
    while n_floors > 0
        line_length = "*" * counter
        star_count << line_length
        counter += 2
        n_floors -= 1
    end

    size = star_count.last.length

    (0..star_count.length-1).each do |x|
        whitespace = size - star_count[x].length
        buffer = whitespace / 2
        centering = " " * buffer
        mountain_by_line << centering
        mountain_by_line << star_count[x]
        mountain_by_line << centering
        mountain << mountain_by_line.join
        mountain_by_line = []
    end

    return mountain
end

puts tower_builder(floors)




# this doesn't account for spaces on either side of the * and is wrong number of *
def broken_tower_builder(n_floors)
    mountain = []
    (1..n_floors).each do |level|
        line_length = "*" * level
        mountain << line_length
    end
    return mountain
end


#using a counter and while loop instead of a range

def while_tower_builder(n_floors)
    star_count = []
    mountain_by_line = []
    mountain = []
    counter = 1
    while n_floors > 0
        line_length = "*" * counter
        star_count << line_length
        counter += 2
        n_floors -= 1
    end
    
    size = star_count.last.length
    num = 0
    while num < star_count.length
        whitespace = size - star_count[num].length
        buffer = whitespace / 2
        centering = " " * buffer
        mountain_by_line << centering
        mountain_by_line << star_count[num]
        mountain_by_line << centering
        mountain << mountain_by_line.join
        mountain_by_line = []
        num += 1
    end
 
    return mountain
end


# nil class error on .length
def nil_class_error_tower_builder(n_floors)
    star_count = []
    mountain_by_line = []
    mountain = []
    counter = 1
    while n_floors > 0
        line_length = "*" * counter
        star_count << line_length
        counter += 2
        n_floors -= 1
    end
    
    size = star_count.last.length
    
    (0..star_count.length).each do |x|
        whitespace = size - star_count[x].length
        buffer = whitespace / 2
        centering = " " * buffer
        mountain_by_line << centering
        mountain_by_line << star_count[x]
        mountain_by_line << centering
        mountain << mountain_by_line.join
        mountain_by_line = []
    end
 
    return mountain
end






