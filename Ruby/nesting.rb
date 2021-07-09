# https://www.codewars.com/kata/520446778469526ec0000001/train/ruby
# [ 1, 1, 1 ].same_structure_as( [ 2, 2, 2 ] )
# [ 1, [ 1, 1 ] ].same_structure_as( [ 2, [ 2, 2 ] ] )
# within Array class you can use 'itself' to reference the array that is having the method 
# same_structure_ called on it


class Array
    def same_structure_as(arr)
        # first check if arg is an array, then if both arrays are the same length
        return "not an array" if arr.class != Array
        return "unequal length" if self.length != arr.length

        output = []
        itself.each_with_index do |item, index|
            # check if each matching item are the same type
            # return "wrong type" if item.class != arr[index].class 
            # ^^ This failed when one item was a string

            if (item.class == Array && arr[index].class != Array) ||
                (item.class != Array && arr[index].class == Array)
                return "wrong type"
            end

            if item.class == Array && arr[index].class == Array
                return "wrong inner length" if item.length != arr[index].length
                return item.same_structure_as(arr[index])
            end

            output << "all good"
        end
        return output       
    end
end

class Array
    def same_structure_as(arr)
        return false if arr.class != Array
        return false if self.length != arr.length

        itself.each_with_index do |item, index|

            if (item.class == Array && arr[index].class != Array) || 
                (item.class != Array && arr[index].class == Array)
                return false
            end

            if item.class == Array && arr[index].class == Array
                return item.same_structure_as(arr[index])
            end
        end
        return true       
    end
end



puts [[1], 1, 1].same_structure_as([[1, 2], 1, 1])

puts [1,'[',']'].same_structure_as(['[',']',1])

# from codewars

class Array

    def same_structure_as(a)
      return false if self.class!=a.class || size!=a.size 
      a.each_index { |i| return false if self[i].class==Array && !self[i].same_structure_as(a[i]) }
      true
    end
    
end