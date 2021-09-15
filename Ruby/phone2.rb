def create_phone_number(numbers)
    template = "(abc) def-ghij"
    pointer = "a"
    numbers.each do |x|
        template = template.gsub(pointer, x.to_s)
        pointer = pointer.next
    end
    return template
end

puts create_phone_number([1, 2, 3, 4, 5, 6, 7, 8, 9, 0])