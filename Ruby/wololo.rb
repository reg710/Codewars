# https://www.codewars.com/kata/59473c0a952ac9b463000064/ruby

# first write a function to solve the letters war
# then write function for special powers conversion

BATTALIONS = {
    w: [4, "m"],
    p: [3, "q"],
    b: [2, "d"],
    s: [1, "z"],
    t: [0, "j"],
    m: [-4, "w"],
    q: [-3, "p"],
    d: [-2, "b"],
    z: [-1, "s"],
    j: [0, "t"]
}


def alphabet_war(fight)
    letters = fight.chars
   
    if letters.include?("t") || letters.include?("j")
        letters = priestly_powers(letters)
    end

    # score = 0
    # letters.each do |value|
    #     score += BATTALIONS.fetch(value.to_sym, 0)
    # end

    score = letters.map{ |value| BATTALIONS.fetch(value.to_sym, 0)[0] }.sum
    
    puts letters
    puts score
    return "Left side wins!" if score > 0
    return "Right side wins!" if score < 0
    return "Let's fight again!"
end

def priestly_powers(letters)
    letters.each_with_index do |letter, index|
        # First checking for a priest and whether there is an opposing priest two steps away
        # Then checking if priest has an opposite party letter standing to the right and left of them within bounds
    
        if letter == "t" && letters[index + 2] != "j" && (letters[index - 2] != "j") 
            if (letters[index + 1] != nil) && (BATTALIONS.fetch(letters[index + 1].to_sym, 0)[0] < 0)
                letters[index + 1] = BATTALIONS.fetch(letters[index + 1].to_sym, letter)[1]
            end

            if (index - 1 >= 0) && (BATTALIONS.fetch(letters[index - 1].to_sym, 0)[0] < 0)
                letters[index - 1] = BATTALIONS.fetch(letters[index - 1].to_sym, letter)[1]
            end
        end
        
        if (letter == "j" && letters[index + 2] != "t" && letters[index - 2] != "t") 
            if (letters[index + 1] != nil) && (BATTALIONS.fetch(letters[index + 1].to_sym, 0)[0] > 0)
                letters[index + 1] = BATTALIONS.fetch(letters[index + 1].to_sym, letter)[1]
            end

            if (index - 1 >= 0) && (BATTALIONS.fetch(letters[index - 1].to_sym, 0)[0] > 0)
                letters[index - 1] = BATTALIONS.fetch(letters[index - 1].to_sym, letter)[1]
            end
        end
    end
    return letters
end


test = "dtj"
test2 = ["t", "z", "z"]
puts alphabet_war(test)
# puts priestly_powers(test2)


