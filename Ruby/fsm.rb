# https://www.codewars.com/kata/54acc128329e634e9a000362/train/ruby


class Automaton
    TRANSITIONS = {
        ["CLOSED", "APP_PASSIVE_OPEN"] => "LISTEN",
        ["CLOSED", "APP_ACTIVE_OPEN"]  => "SYN_SENT",       
        ["LISTEN", "RCV_SYN"]          => "SYN_RCVD",
        ["LISTEN", "APP_SEND"]         => "SYN_SENT",
        ["LISTEN", "APP_CLOSE"]        => "CLOSED",
        ["SYN_RCVD", "APP_CLOSE"]      => "FIN_WAIT_1",
        ["SYN_RCVD", "RCV_ACK"]        => "ESTABLISHED",
        ["SYN_SENT", "RCV_SYN"]        => "SYN_RCVD",
        ["SYN_SENT", "RCV_SYN_ACK"]    => "ESTABLISHED",
        ["SYN_SENT", "APP_CLOSE"]      => "CLOSED",
        ["ESTABLISHED", "APP_CLOSE"]   => "FIN_WAIT_1",
        ["ESTABLISHED", "RCV_FIN"]     => "CLOSE_WAIT",
        ["FIN_WAIT_1", "RCV_FIN"]      => "CLOSING",
        ["FIN_WAIT_1", "RCV_FIN_ACK"]  => "TIME_WAIT",
        ["FIN_WAIT_1", "RCV_ACK"]      => "FIN_WAIT_2",
        ["CLOSING", "RCV_ACK"]         => "TIME_WAIT",
        ["FIN_WAIT_2", "RCV_FIN"]      => "TIME_WAIT",
        ["TIME_WAIT", "APP_TIMEOUT"]   => "CLOSED",
        ["CLOSE_WAIT", "APP_CLOSE"]    => "LAST_ACK",
        ["LAST_ACK", "RCV_ACK"]        => "CLOSED"
    }
    
    def initialize
        @state = "CLOSED"
    end

    def traverse_TCP_states(eventList)
        eventList.each do |cmd|
            @state = TRANSITIONS.fetch([@state, cmd], "ERROR")
        end
      
        return @state
    end
end

robot = Automaton.new

puts robot.traverse_TCP_states(["RCV_SYN","RCV_ACK","APP_CLOSE"])




class Machine
    def initialize
      @states = {
        "CLOSED" => { "APP_PASSIVE_OPEN" => "LISTEN", "APP_ACTIVE_OPEN" => "SYN_SENT"}, 
        "LISTEN" => {"RCV_SYN" => "SYN_RCVD", "APP_SEND" => "SYN_SENT", "APP_CLOSE" => "CLOSED"},
        "SYN_RCVD" => {"APP_CLOSE" => "FIN_WAIT_1", "RCV_ACK" => "ESTABLISHED"},
        "SYN_SENT" => {"RCV_SYN" => "SYN_RCVD", "RCV_SYN_ACK" => "ESTABLISHED", "APP_CLOSE" => "CLOSED"},
        "ESTABLISHED" => {"APP_CLOSE" => "FIN_WAIT_1", "RCV_FIN" => "CLOSE_WAIT"},
        "FIN_WAIT_1" => {"RCV_FIN" => "CLOSING", "RCV_FIN_ACK" => "TIME_WAIT", "RCV_ACK" => "FIN_WAIT_2"},
        "CLOSING" => {"RCV_ACK" => "TIME_WAIT"},
        "FIN_WAIT_2" => {"RCV_FIN" => "TIME_WAIT"},
        "TIME_WAIT" => {"APP_TIMEOUT" => "CLOSED"},
        "CLOSE_WAIT" => {"APP_CLOSE" => "LAST_ACK"}, 
        "LAST_ACK" => {"RCV_ACK" => "CLOSED"}
      }
    end

    def traverse_TCP_states(eventList)
        state = "CLOSED"
        
        eventList.each do |eventList|
            if @states.include? @states[state][eventList]
                state = @states[state][eventList]
            else
                return "ERROR"
            end
        end
        
        return state
    end
end

another_robot = Machine.new

puts another_robot.traverse_TCP_states(["RCV_SYN","RCV_ACK","APP_CLOSE"])