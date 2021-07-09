def unique_in_order(iterable)
    #your code here
    iterable = iterable.split(//)
    iterable.each do |i|
        if iterable[i] != iterable[i + 1]
            puts "yeah"
        end
    end

  end


  puts unique_in_order("AAAABBBCCDAABBB")