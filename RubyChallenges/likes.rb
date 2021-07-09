names = ["Alex", "Jacob", "Mark"]
display = ""
if names.length == 0
    display = "no one likes this"
elsif names.length == 1
    display = "#{names[0]} likes this"
elsif names.length == 2
    display = "#{names[0]} and #{names[1]} like this"
elsif names.length == 3
    display = "#{names[0]}, #{names[1]} and #{names[2]} like this"
elsif names.length > 3
    display = "#{names[0]}, #{names[1]} and #{names.length - 2} others like this"
end

puts display