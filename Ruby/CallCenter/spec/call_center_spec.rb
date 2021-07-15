require 'call_center'

describe Respondent do
    it "can create a new nameless, available respondent" do
       person = Respondent.new
       expect(person.name).to eql nil
       expect(person.status).to eql "available" 
    end
end

# ran this test to see how to write it, but don't know how to actually test for a random true or false result
describe Call do
    it "can be called on" do
       call = Call.new
    #    expect(call.try_to_resolve).to eql "boop" 
        expect(call.try_to_resolve).to eql true
    end
end

describe CallCenter do
    
    context "#initialize" do
        it "can create an array with a single Respondent" do
            center = CallCenter.new(1, 1, 1)
            expect(center.respondents[0].name).to eql "resp1"
            expect(center.respondents[0].status).to eql "available"
        end

        it "can find respondants by index" do
            center = CallCenter.new(3, 1, 1)
            expect(center.respondents[1].name).to eql "resp2"
        end

        # Is this testing too many things for one test?
        it "can set name with number for each Respondent" do
            center = CallCenter.new(3, 1, 1)
            expect(center.respondents[0].name).to eql "resp3"
            expect(center.respondents[1].name).to eql "resp2"
            expect(center.respondents[2].name).to eql "resp1"
        end

        it "can create an array with a single Manager" do
            center = CallCenter.new(1, 1, 1)
            expect(center.managers[0]).to eql "mng1"
        end

        it "can set name with number for each Manager" do
            center = CallCenter.new(3, 3, 1)
            expect(center.managers[0]).to eql "mng3"
            expect(center.managers[1]).to eql "mng2"
            expect(center.managers[2]).to eql "mng1"
        end

        it "can create an array with a single Director" do
            center = CallCenter.new(1, 1, 1)
            expect(center.directors[0]).to eql "dir1"
        end

        it "can set name with number for each Director" do
            center = CallCenter.new(3, 3, 3)
            expect(center.directors[0]).to eql "dir3"
            expect(center.directors[1]).to eql "dir2"
            expect(center.directors[2]).to eql "dir1"
        end

    end

    context "#dispatch_call" do
        # it "can take in a Call object" do
        #     center = CallCenter.new(3)
        #     call = Call.new
        #     expect(center.dispatch_call(call.try_to_resolve)).to eql "solve this call"
        # end

        it "for a solveable call, if a resp is free say who answered" do
            center = CallCenter.new(3, 1, 1)
            call = Call.new
            expect(center.dispatch_call(true)).to eql "Your call was handled by resp1"
        end

        it "for a solveable call, changes position of resp in queue" do
            center = CallCenter.new(3, 1, 1)
            call = Call.new
            center.dispatch_call(true)
            expect(center.respondents[0].name).to eql "resp1"
            expect(center.respondents[1].name).to eql "resp3"
            expect(center.respondents[2].name).to eql "resp2"
        end

        it "after two solveable calls, changes position of resp in queue twice" do
            center = CallCenter.new(3, 1, 1)
            call = Call.new
            center.dispatch_call(true)
            center.dispatch_call(true)
            expect(center.respondents[0].name).to eql "resp2"
            expect(center.respondents[1].name).to eql "resp1"
            expect(center.respondents[2].name).to eql "resp3"
        end

        it "for a solveable call with no free resp, if a mng is free say who answered " do
            center = CallCenter.new(0, 3, 1)
            call = Call.new
            expect(center.dispatch_call(true)).to eql "Your call was handled by mng1"
        end

        it "for a solveable call with no free resp, change position of mng in queue" do
            center = CallCenter.new(0, 3, 1)
            call = Call.new
            center.dispatch_call(true)
            expect(center.managers[0]).to eql "mng1"
            expect(center.managers[1]).to eql "mng3"
            expect(center.managers[2]).to eql "mng2"
        end


    end
    

end