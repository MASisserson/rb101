# Cakes
=begin
Pete likes to bake some cakes. He has some recipes and ingredients. Unfortunately he is not good in maths. Can you help him to find out, 
how many cakes he could bake considering his recipes?

Write a function cakes(), which takes the recipe (object) and the available ingredients (also an object) and returns the maximum number of cakes Pete can bake (integer). 
For simplicity there are no units for the amounts (e.g. 1 lb of flour or 200 g of sugar are simply 1 or 200). Ingredients that are not present in the objects, can be considered as 0.

input: 2 hashes (recipe, on_hand)
return: integer

Rules:
1. Extra ingredients on_hand can be ignored.
2. Extra ingredients in recipe mean return 0
3. Lowest result from division is the nubmer of cakes that can be returned.

Mental Model:
Cycle through all all members of the recipe hash, checking how they divide into the on_hand hash members. Return the lowest number post division.

High Level Plan:
1. Check to make sure that on_hand has at least some of every ingredient in the recipe. If not, return 0. (helper method, takes two hashes returns a boolean; true if all there, false if not)
    - Make array of keys of recipe, iterate through this array, see if each key is present in the on_hand array of keys.
2. Check how many times each ingredient from the recipe can fit into the on_hand quantities available, and store that in a collection. (helper method, takes 2 hashes, returns an array)
    - Iterate through the recipe hash, same key in the on_hand hash and divide, saving the result in an array (cakes)
3. Return the lowest number from that collection.
    - Find the minimum number in cakes

=end


def all_there?(recipe, on_hand)
  recipe.keys.each do |ingredient|
    return false if !(on_hand.keys.include? ingredient)
  end

  true
end

def how_many_cakes(recipe, on_hand)
  cakes = []
  recipe.each do |ingredient, quantity|
    cakes << on_hand[ingredient] / quantity
  end

  cakes
end

def cakes(recipe, on_hand)
  return 0 if !all_there?(recipe, on_hand)
  cakes = how_many_cakes(recipe, on_hand)
  cakes.min
end


p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) == 2
p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000}) == 0
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) == 0
p cakes({"eggs"=>4, "flour"=>400},{}) == 0
p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}) == 1
