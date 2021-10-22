# Given a List (or array) of weekday abbreviations (M, Tu, W, Th, F, Sa, Su), implement a function that returns a string of the abbreviations sorted M-Su.


DATES = {
    M: 1,
    Tu: 2,
    W: 3,
    Thu: 4,
    F: 5,
    Sat: 6,
    Sun: 7
}

def sort(input)
    output = {}

    input.each do |day|
        output[day] = DATES.fetch(day.to_sym)
    end

    return output.sort_by(&:last).to_h.keys.join(", ")   
end

test = ["Tu", "Thu", "M", "W", "F"]
puts sort(test)