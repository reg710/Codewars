# https://www.codewars.com/kata/5268acac0d3f019add000203/ruby


class Automaton
    def initialize
      @current_state = "q1"
    end
    
    def read_commands(commands)
        # remove initial zeros which do not change state from q1
        while commands.first == "0"
            commands.shift
        end

        # once we reach our first "1", either the array is empty or the state changes to q2
        if commands == []
            return "false"
        else
            commands.shift
            @current_state = "q2"
        end

        # Any command in q3 resets to q2. Only a 0 from q2 moves to q3.
        commands.each do |command|
            if @current_state == "q3"
                @current_state = "q2"
            elsif @current_state == "q2" && command == "0"
                @current_state = "q3"
            end
        end
        @current_state == "q2" ? "true" : "false"
    end
end


test = ["1"]

mario = Automaton.new
puts mario.read_commands(test)