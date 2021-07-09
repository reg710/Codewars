# https://www.codewars.com/kata/56af1a20509ce5b9b000001e
# separate addresses
# select appropriate addresses, or return "zipcode:/"
# reformat selected addresses to be 
    # zipcode:street and town,street and town,.../house number,house number,...


test_addresses = "123 Main Street St. Louisville OH 43071,432 Main Long Road St. Louisville OH 43071,786 High Street Pollocksville NY 56432"
test_zip = "OH 43071"

def travel(r, zipcode)
    house_number = []
    street = []
    address_book = r.split(',')
   
    if zipcode.length < 8
        return "#{zipcode}:/"
    else
        client_addresses = address_book.select {|a| a.include? zipcode}
        client_addresses.each do |address|
            street_address = address.gsub!(" #{zipcode}", "")
            street_address_array = street_address.split(" ", 2)
            house_number << street_address_array[0]
            street << street_address_array[1]
        end
        return "#{zipcode}:#{street.join(",")}/#{house_number.join(",")}"
    end
end

def travel(r, zipcode)
    house_number = []
    street = []
    street_array = []
    address_book = r.split(',')

    if zipcode.length < 8
        return "#{zipcode}:/"
    else
        client_addresses = address_book.select {|a| a.include? zipcode}
        client_addresses.each do |address|
            street_array = address.split(" ")
            number = [street_array[0]]
            zip = zipcode.split(" ")
            street_array = street_array - number - zip
            house_number << number
            street << street_array.join(" ")
        end
        return "#{zipcode}:#{street.join(",")}/#{house_number.join(",")}"
    end
end

puts travel(test_addresses, test_zip)