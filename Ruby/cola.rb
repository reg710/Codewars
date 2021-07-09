# https://www.codewars.com/kata/551dd1f424b7a4cdae0001f0/train/ruby

test = ["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"]

def who_is_next(names, r)
    while r > 0
        names.append(names[0])
        names.append(names[0])
        names.shift        
        r -= 1
    end
    return names.last
end

puts who_is_next(test, 1)


# codewars

def whoIsNext(names, r)
    r -= 1
    while r >= names.size
      r -= names.size
      r /= 2
    end
    names[r]
end
  