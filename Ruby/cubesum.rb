# https://www.codewars.com/kata/59a8570b570190d313000037

def sum_cubes(n)
    cubes = (1..n).map { |num| num * num * num}
    return cubes.sum
end


#from codewars
def sum_of_cubes(n)
    (1..n).sum { |i| i**3 }
end