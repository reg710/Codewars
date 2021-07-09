# https://www.codewars.com/kata/525c65e51bf619685c000059/train/ruby
# check if we have all ingredients, if not return 0
# divide ingredients by recipe, return smallest number

yes_recipe = {flour: 500, sugar: 200, eggs: 1}
yes_ingredients = {flour: 1200, sugar: 1200, eggs: 5, milk: 200}
no_recipe = {apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}
no_ingredients = {sugar: 500, flour: 2000, milk: 2000}


def cakes(recipe, pantry)
    if (recipe.keys - pantry.keys).length > 0
        return 0
    else
        numbers = []
        recipe.each_key do |key|
            numbers << (pantry[key]/recipe[key]).floor
        end
        return numbers.sort.first
    end
end

puts cakes(yes_recipe, yes_ingredients)
puts cakes(no_recipe, no_ingredients)
