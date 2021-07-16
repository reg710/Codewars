# A call center has three types of employees, so when creating a new center, it will require the number of each type
# Each employee type has two possible states - free/busy
# If a busy employee can handle a call, they become free again
# One way to keep track of who is busy and who is free, is to have two separate arrays/queues? one for each type.
# Unclear what happens with a call is not solveable - assuming the employee is then left in busy state permanently. A neverending call......

class Respondent
    attr_accessor :name
    attr_accessor :status

    def initialize
        @status = "available"
    end
end

class Call
    def try_to_resolve
        #the random number is what the program will need but for the test, set to true
        # rand() > 0.5
        return true
    end
end

class CallCenter

    # available and busy queues for each employee type
    attr_accessor :respondents
    attr_accessor :r_busy
    
    attr_accessor :managers
    attr_accessor :m_busy

    attr_accessor :directors
    attr_accessor :d_busy

  
    def initialize(r_count, m_count, d_count)
        # Using the counts of employee types to create queues for each type, filled with numbered employees.
        # Also creating empty queue which will be where busy employees are moved to when on unsolveable calls
        # Initally made a repsondent class to store status but this may be redundant with a second busy queue in place? That is why the other two types are not their own class for now.

        @respondents = Array.new 
        (0...r_count).each do |x|
            person = Respondent.new
            person.name = "resp#{(x+1).to_s}"
            @respondents << person
        end
        @respondents = @respondents.reverse      

        @managers = Array.new
        (0...m_count).each do |x|
            @managers << "mng#{(x+1).to_s}"
        end
        @managers = @managers.reverse

        @directors = Array.new
        (0...d_count).each do |x|
            @directors << "dir#{(x+1).to_s}"
        end
        @directors = @directors.reverse

        @r_busy = Array.new
        @m_busy = Array.new
        @d_busy = Array.new

    end

    # the call center will use this method to assign the call
    # it will need to take in as a variable a Call.try_to_resolve result
    def dispatch_call(incoming_call)
        # if no one is avaiable, only response is Waiting
        # Could I check if the busy arrays are equal to total count of employees?
        if @respondents.length + @managers.length + @directors.length == 0
            return "WAITING"
        end

        # break down paths between solveable and unsolveable calls
        if incoming_call
            if @respondents.length > 0
                call_taker = handles_call(@respondents).name
            elsif @managers.length > 0
                call_taker = handles_call(@managers)
            elsif @directors.length > 0
                call_taker = handles_call(@directors)
            end
            return "Your call was handled by #{call_taker}"
        else
            if @directors.length > 0
                call_taker = on_call(@directors, @d_busy)
            elsif @managers.length > 0
                call_taker = on_call(@managers, @m_busy)
            elsif @respondents.length > 0
                call_taker = @respondents.pop
                call_taker.status = "busy"
                @r_busy.unshift(call_taker)
                call_taker = call_taker.name
            end
            return "Your call is being handled by #{call_taker}"
        end

    end

    def handles_call(available_queue)
        call_taker = available_queue.pop
        available_queue.unshift(call_taker)
        return call_taker
    end

    def on_call(available_queue, busy_queue)
        call_taker = available_queue.pop
        busy_queue.unshift(call_taker)
        return call_taker
    end


end
