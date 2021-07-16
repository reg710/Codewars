require 'call_center'

describe Respondent do
    it "can create a new nameless, available respondent" do
       person = Respondent.new
       expect(person.name).to eql nil
       expect(person.status).to eql "available" 
    end
end

# ran this test to see how to write it, in tests below I'm just hardcoding if a call returns true or false
describe Call do
    it "can be called on" do
        call = Call.new
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

    context "#dispatch_call -- solveable calls" do
        it "can take in a Call object" do
            center = CallCenter.new(3, 1, 1)
            call = Call.new
            expect(center.dispatch_call(call.try_to_resolve)).to eql "Your call was handled by resp1"
        end

        it "if a resp is free say who answered" do
            center = CallCenter.new(3, 1, 1)
            expect(center.dispatch_call(true)).to eql "Your call was handled by resp1"
        end

        it "changes position of resp in queue" do
            center = CallCenter.new(3, 1, 1)
            center.dispatch_call(true)
            expect(center.respondents[0].name).to eql "resp1"
            expect(center.respondents[1].name).to eql "resp3"
            expect(center.respondents[2].name).to eql "resp2"
        end

        it "after two solveable calls, changes position of resp in queue twice" do
            center = CallCenter.new(3, 1, 1)
            center.dispatch_call(true)
            center.dispatch_call(true)
            expect(center.respondents[0].name).to eql "resp2"
            expect(center.respondents[1].name).to eql "resp1"
            expect(center.respondents[2].name).to eql "resp3"
        end

        it "with no free resp, if a mng is free say who answered " do
            center = CallCenter.new(0, 3, 1)
            expect(center.dispatch_call(true)).to eql "Your call was handled by mng1"
        end

        it "with no free resp, change position of mng in queue" do
            center = CallCenter.new(0, 3, 1)
            center.dispatch_call(true)
            expect(center.managers[0]).to eql "mng1"
            expect(center.managers[1]).to eql "mng3"
            expect(center.managers[2]).to eql "mng2"
        end

        it "with no free resp or mng, if a dir is free say who answered " do
            center = CallCenter.new(0, 0, 1)
            expect(center.dispatch_call(true)).to eql "Your call was handled by dir1"
        end

        it "with no free resp or mng, change position of dir in queue" do
            center = CallCenter.new(0, 0, 3)
            center.dispatch_call(true)
            expect(center.directors[0]).to eql "dir1"
            expect(center.directors[1]).to eql "dir3"
            expect(center.directors[2]).to eql "dir2"
        end

        it "with no one free, tell them to wait" do
            center = CallCenter.new(0, 0, 0)
            expect(center.dispatch_call(true)).to eql "WAITING"
        end
    end

    context "#dispatch_call -- unsolveable calls" do

        it "with a free director, say who answered" do
            center = CallCenter.new(0, 0, 1)
            expect(center.dispatch_call(false)).to eql "Your call is being handled by dir1"
        end

        it "with no free directors, say who answered" do
            center = CallCenter.new(0, 1, 0)
            expect(center.dispatch_call(false)).to eql "Your call is being handled by mng1"
        end

        it "with no free directors or managers, say who answered" do
            center = CallCenter.new(1, 0, 0)
            expect(center.dispatch_call(false)).to eql "Your call is being handled by resp1"
        end
    end 
    
    context "#dispatch_call -- multiple calls" do
        
        it "for two calls, manager assigned to second call" do
            center = CallCenter.new(1, 1, 1)
            center.dispatch_call(false)
            second_call = center.dispatch_call(false)
            expect(second_call).to eql "Your call is being handled by mng1"
        end

        it "solveable with no resp is handled by manager" do
            center = CallCenter.new(0, 1, 1)
            center.dispatch_call(false)
            expect(center.dispatch_call(true)).to eql "Your call was handled by mng1"
        end
    end

end