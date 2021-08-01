# https://www.codewars.com/kata/5938f5b606c3033f4700015a

SOLDIERS = {
    w: 4,
    p: 3,
    b: 2,
    s: 1,
    m: -4,
    q: -3,
    d: -2,
    z: -1
}

def bombs_away(field)
    field_array = field.chars
    field_array.each_with_index do |char, index|
        if char == "*"
            field_array[index] = "_"
            if index > 0
                field_array[index - 1] = "_"
            end
            # don't change the character to the right if it's a bomb, 
            # because it still needs to explode itself
            if (index < field_array.length - 1) && (field_array[index + 1] != "*")
                field_array[index + 1] = "_"
            end
        end
    end
    return field_array
end

def alphabet_war(fight)
    after_bombs = bombs_away(fight)
    score = after_bombs.map {|char| SOLDIERS.fetch(char.to_sym, 0)}.sum
    return "Left side wins!" if score > 0
    return "Right side wins!" if score < 0
    return "Let's fight again!"
end

test = "*wwwwww*z*"



# puts bombs_away(test)

puts alphabet_war(test)
