# https://www.codewars.com/kata/53368a47e38700bd8300030d/train/ruby
# try getting names out of hash into an array

# test = [ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'} ]
# test = [ {name: 'Bart'}, {name: 'Lisa'} ]
# test = [ {name: 'Bart'}]
test = []

def list names
    just_names = []
    names.each do |hash|
        hash.each do |key, value|
            just_names << value + ',' 
        end
    end
    
    if just_names.length > 2
        just_names[-2] = "#{just_names[-2].chop} & #{just_names[-1].chop}"
        just_names.pop
        return just_names.join(' ')
    elsif just_names.length == 2
        return just_names[0] = "#{just_names[0].chop} & #{just_names[1].chop}"
    else
        return just_names.join.chop
    end
end

puts list(test)

# from codewars

def list names
    names = names.map { |name| name[:name] }
    last_name = names.pop
    return last_name.to_s if names.empty?
    "#{names.join(', ')} & #{last_name}"
end