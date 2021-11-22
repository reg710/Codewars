# https://www.codewars.com/kata/57f625992f4d53c24200070e/ruby


# First look at arrays within tickiet for a mini win (can only have one)
# Mini win = char code matches number
# Sum of mini wins is greater than/equal to win you're a real winner

def bingo(ticket,win)
    # Check if there are enough tickets to create a win at all
    return "Loser!" if ticket.length < win

    mini_win = 0
    ticket.each do |mini_ticket|
        character_codes = mini_ticket[0].chars.map {|x| x.ord}
        if character_codes.include?(mini_ticket[1])
            mini_win += 1
        end
    end
    
    mini_win >= win ? "Winner!" : "Loser!"

end

ticket = [['ABC', 65], ['HGR', 74], ['BYHT', 74]]
win = 1


puts bingo(ticket, win)