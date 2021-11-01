# https://www.codewars.com/kata/583203e6eb35d7980400002a/train/ruby

def count_smileys(arr)
    #returns an array with only accepted eyes
    eyes_for_you = arr.select { |x| x[0] == ":" || x[0] == ";"}

    # returns an array with only accepted mouths
    knowing_smiles = eyes_for_you.select {|x| x[-1] == ")" || x[-1] == "D"}

    # divides what is left by length
    splitter = knowing_smiles.partition {|x| x.length == 3}
    long_faces = splitter[0]
    short_faces = splitter[1]

    # returns an array with only accepted noses 
    button_noses = long_faces.select {|x| x[1]== "-" || x[1] == "~"}
    
    # combines correct short and long faces
    smiling_faces = button_noses + short_faces
    return smiling_faces.length
end

test = [":-)",";(","=D", ":D", ";-D"]


puts count_smileys(test)