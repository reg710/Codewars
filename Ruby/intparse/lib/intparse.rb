# https://www.codewars.com/kata/525c7c5ab6aecef16e0001a5/ruby

class Parser
    DICTIONARY = {
        zero: 0,
        one: 1,
        two: 2,
        three: 3,
        four: 4,
        five: 5,
        six: 6,
        seven: 7,
        eight: 8,
        nine: 9,
        ten: 10,
        eleven: 11,
        twelve: 12,
        thirteen: 13,
        fourteen: 14,
        fifteen: 15,
        sixteen: 16,
        seventeen: 17,
        eighteen: 18,
        nineteen: 19,
        twenty: 20,
        thirty: 30,
        forty: 40,
        fifty: 50,
        sixty: 60,
        seventy: 70,
        eighty: 80,
        ninety: 90
    }

    def parse_int(string)
        output = []
        millions = []
        hundredthousands = []
        thousands = []
        hundreds = []

        start_point = 0

        # Remove extra formatting issues like hyphens, spaces, and 'and'
        string = string.downcase
        standardized = string.gsub("-", " ")
        standardized = standardized.gsub(" and", " ").squeeze(" ")
        standardized_arr = standardized.split(" ")

        # First calculate amount of millions
        if standardized_arr.include?("million")
            (start_point...standardized_arr.index("million")).each do |index|
                millions << DICTIONARY.fetch(standardized_arr[index].to_sym)
            end
            output << (millions.sum * 1000000)
            start_point = (standardized_arr.index("million") + 1)
        end

        # Calculate amount of thousands
        if standardized_arr.include?("thousand")
            
            # Need to also check if there are 'hundred thousand' amounts
            if standardized_arr.include?("hundred") &&
            standardized_arr.index("hundred") < standardized_arr.index("thousand")
                (start_point...standardized_arr.index("hundred")).each do |index|
                    hundredthousands << DICTIONARY.fetch(standardized_arr[index].to_sym)
                end
                output << (hundredthousands.sum * 100000)
                start_point = (standardized_arr.index("hundred") + 1)
                
                # Need to update first instance of 'hundred' or later check won't catch second instance
                standardized_arr[standardized_arr.index("hundred")] = ""
            end
            
            (start_point...standardized_arr.index("thousand")).each do |index|
                thousands << DICTIONARY.fetch(standardized_arr[index].to_sym)
            end
            output << (thousands.sum * 1000)
            start_point = (standardized_arr.index("thousand") + 1)
        end

        # Calculating amount of hundreds
        if standardized_arr.include?("hundred")
            (start_point...standardized_arr.index("hundred")).each do |index|
                hundreds << DICTIONARY.fetch(standardized_arr[index].to_sym)
            end
            output << (hundreds.sum * 100)
            start_point = (standardized_arr.index("hundred") + 1)
        end

        # Calculating remaining amount
        (start_point...standardized_arr.length).each do |index|
            output << DICTIONARY.fetch(standardized_arr[index].to_sym)
        end

        return output.sum
    end
end

p = Parser.new
test = "one million five thousand six hundred"
puts p.parse_int(test)