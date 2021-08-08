require 'parse'

describe Parser do
    context "#parse_int" do
        
        # it "can remove hyphens" do
        #     p = Parser.new
        #     expect(p.parse_int("twenty-one")).to eql "twenty one"
        # end

        # it "can remove 'and'" do
        #     p = Parser.new
        #     expect(p.parse_int("one hundred and twenty-one")).to eql "one hundred twenty one"
        # end

        # it "can find single digits in the dictionary" do
        #     p = Parser.new
        #     expect(p.parse_int("one")).to eql 1
        # end

        # it "can separate out the millions" do
        #     p = Parser.new
        #     expect(p.parse_int("one million")).to eql 1000000
        # end

        it "can return one number before million" do
            p = Parser.new
            expect(p.parse_int("two million")).to eql 2000000
        end

        it "can return two numbers before million" do
            p = Parser.new
            expect(p.parse_int("twenty one million")).to eql 21000000
        end

        it "can return million and hundred" do
            p = Parser.new
            expect(p.parse_int("one million and one hundred")).to eql 1000100
        end

        it "can return million, thousand, and hundred" do
            p = Parser.new
            expect(p.parse_int("one-million one thousand and one hundred")).to eql 1001100
        end

        it "can return million and one" do
            p = Parser.new
            expect(p.parse_int("one million one")).to eql 1000001
        end

        it "can return million, thousand, and hundred, and ones" do
            p = Parser.new
            expect(p.parse_int("one-million one thousand and one hundred twenty-seven")).to eql 1001127
        end

        it "can handle one hundred thousand" do
            p = Parser.new
            expect(p.parse_int("one hundred thousand")).to eql 100000
        end

        it "can handle random test" do
            p = Parser.new
            expect(p.parse_int("six hundred sixty six thousand")).to eql 100000
        end
    end

end