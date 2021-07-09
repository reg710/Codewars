# https://www.codewars.com/kata/525f3eda17c7cd9f9e000b39
# first do one plus one and get it working


def one(*args)
    args.count == 0 ? "1" : eval("1#{args.join}")

    # If the function has no argument, it is the inner number
    # The args are taken in as an array, so join them to create a string to be evaluated

    # if args.count == 0
    #     return "1"
    # else
    #     return eval("1#{args.join}")
    # end
end

def two(*args)
    args.count == 0 ? "2" : eval("2#{args.join}")
end

def three(*args)
    args.count == 0 ? "3" : eval("3#{args.join}")
end

def four(*args)
    args.count == 0 ? "4" : eval("4#{args.join}")
end

def five(*args)
    args.count == 0 ? "5" : eval("5#{args.join}")
end

def six(*args)
    args.count == 0 ? "6" : eval("6#{args.join}")
end

def seven(*args)
    args.count == 0 ? "7" : eval("7#{args.join}")
end

def eight(*args)
    args.count == 0 ? "8" : eval("8#{args.join}")
end

def nine(*args)
    args.count == 0 ? "9" : eval("9#{args.join}")
end

def zero(*args)
    args.count == 0 ? "0" : eval("0#{args.join}")
end

def plus(value)
   "+#{value}"
end

def minus(value)
    "-#{value}"
end

def times(value)
    "*#{value}"
end

def divided_by(value)
    "/#{value}"
end

puts four(plus(four()))

# from codewars
# you can use .to_sym to convert string to symbols