response = ""

def people_age(old)
    if (old >= 21)
        response = "drink whisky"
    elsif (old < 21 && old >= 18)
        response = "drink beer" 
    elsif (old < 18 && old >= 14)
        response = "drink coke"
    elsif (old < 14)
        response = "drink toddy" 
    end
    return response
end

puts people_age(21)