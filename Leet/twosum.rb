# First want to remove any numbers that are greater than the target from consideration
# Unless numbers can be negative then that's pointless :(

def two_sum(nums, target)
    # divided = nums.partition {|x| x < target}
    # below_target = divided[0]
    output = []
    # nums.each_with_index do |x, index|
    #     nums[((index + 1)..nums.length)].each_with_index do |y, ind|
    #         if ((x + y) == target) 
    #             output << index
    #             output << index + ind + 1
    #             return output
    #         end
    #     end
    # end
    (0..nums.length).each do |x|
        ((x + 1)..nums.length).each do |y|
            if nums[x] + nums[y] == target
                output << x
                output << y
                return output
            end
        end
    end
end
nums = [2,7,11,15]
target = 9
puts two_sum(nums, target)