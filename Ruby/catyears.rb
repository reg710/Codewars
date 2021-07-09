# https://www.codewars.com/kata/5a6663e9fd56cb5ab800008b/ruby

human_years = 10
counter = human_years
cat_years = 0
dog_years = 0

while (counter > 0)
    if counter > 2
        cat_years += 4
        dog_years += 5
    elsif counter == 2
        cat_years += 9
        dog_years += 9
    elsif counter == 1
        cat_years += 15
        dog_years += 15
    end
    counter -= 1
end

puts human_years, cat_years, dog_years
