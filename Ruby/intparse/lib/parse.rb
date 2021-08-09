# https://www.codewars.com/kata/525c7c5ab6aecef16e0001a5/ruby
# Coudln't handle hundred thousands, moved to intparse for another approach

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
        ninety: 90,
        hundred: 100,
        thousand: 1000,
        million: 1000000
    }

    def parse_int(string)
        output = []
        denominations = ["million", "thousand", "hundred"]
        start_point = 0
        temp = []
        special_temp = []

        standardized = string.gsub("-", " ")
        standardized = standardized.gsub(" and", " ").squeeze(" ")
        standardized_arr = standardized.split(" ")

       
        denominations.each do |category|
            if standardized_arr.include?(category)
                end_point = standardized_arr.index(category)

                if standardized_arr.include?("hundred") && standardized_arr.include?(category) &&
                    standardized_arr.index("hundred") < standardized_arr.index(category)
                    (start_point...standardized_arr.index("hundred")).each do |index|
                        special_temp << DICTIONARY.fetch(standardized_arr[index].to_sym)
                    end
                    temp << (special_temp.sum * 100)
                    start_point = (standardized_arr.index("hundred") + 1)
                end


                (start_point...end_point).each do |index|
                    temp << DICTIONARY.fetch(standardized_arr[index].to_sym)    
                end
                
                output << (temp.sum * DICTIONARY.fetch(category.to_sym))
                
                start_point = end_point + 1
                temp = []
            end
        end

        (start_point...standardized_arr.length).each do |index|
            output << DICTIONARY.fetch(standardized_arr[index].to_sym)
        end

        return output.sum
    end

end

