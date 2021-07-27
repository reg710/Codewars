# https://www.codewars.com/kata/59473c0a952ac9b463000064/train/ruby

BATTALIONS = {
    w: 4,
    p: 3,
    b: 2,
    s: 1,
    t: 0,
    m: -4,
    q: -3,
    d: -2,
    z: -1, 
    j: 0
}

def alphabet_war(fight)
    letters = fight.chars
    lefties = "wpbs"
    righties = "mqdz"
    score = []
    letters.each_with_index do |letter, index|
        #if it's the first letter
        if index == 0
            if lefties.include? letter
                if letters[index + 1] == "j"
                    score << -(BATTALIONS.fetch(letter.to_sym, 0))
                else   
                    score << BATTALIONS.fetch(letter.to_sym, 0)
                end
            elsif righties.include? letter
                if letters[index + 1] == "t"
                    score << -(BATTALIONS.fetch(letter.to_sym, 0))
                else   
                    score << BATTALIONS.fetch(letter.to_sym, 0)
                end
            else
                score << 0
            end    

        #if it's the last letter
        elsif index == (letters.length - 1)
            if lefties.include? letter
                if letters[index - 1] == "j"
                    score << -(BATTALIONS.fetch(letter.to_sym, 0))
                else   
                    score << BATTALIONS.fetch(letter.to_sym, 0)
                end
            elsif righties.include? letter
                if letters[index - 1] == "t"
                    score << -(BATTALIONS.fetch(letter.to_sym, 0))
                else   
                    score << BATTALIONS.fetch(letter.to_sym, 0)
                end
            else
                score << 0
            end 
              
        else 
            if lefties.include? letter
                if (letters[index - 1] == "j" && letters[index + 1] != "t") ||
                    (letters[index + 1] == "j" && letters[index - 1] != "t")
                    score << -(BATTALIONS.fetch(letter.to_sym, 0))
                else
                    score << (BATTALIONS.fetch(letter.to_sym, 0))
                end
            elsif righties.include? letter
                if (letters[index - 1] == "t" && letters[index + 1] != "j") ||
                    (letters[index + 1] == "t" && letters[index - 1] != "j")
                    score << -(BATTALIONS.fetch(letter.to_sym, 0))
                else
                    score << (BATTALIONS.fetch(letter.to_sym, 0))
                end
            else
                score << 0
            end
        end
    end
    
    score = score.sum
    return "Left side wins!" if score > 0
    return "Right side wins!" if score < 0
    return "Let's fight again!"
end

test = "zdqmwpbs"
puts alphabet_war(test)