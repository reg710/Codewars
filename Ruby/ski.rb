
test_array = ["*", "**", "***"]
test_two = ["*", "**", "***", "****", "*****", "******"]

def ski_jump(mountain)
    mountain_height = mountain.length
    speed = mountain_height * 1.5
    jump_length = ((mountain_height * speed * 9)/10).to_f
    
    # this weird thing will convert the number to a string and make it a two point decimal
    # could also be ("%.2f" % jump_length) without sprintf
    adjusted = sprintf "%.2f", jump_length

    if jump_length < 10
        output = "#{adjusted} metres: He's crap!"
    elsif jump_length < 25
        output = "#{adjusted} metres: He's ok!"
    elsif jump_length < 50
        output = "#{adjusted} metres: He's flying!"
    elsif jump_length > 50
        output = "#{adjusted} metres: Gold!!"
    end
    return output

end

puts ski_jump(test_two)