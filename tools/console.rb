require_relative '../config/environment.rb'

salt = Ingredient.new("salt")
sugar = Ingredient.new("sugar")
carrot = Ingredient.new("carrot")
milk = Ingredient.new("milk")
beans = Ingredient.new("beans")
chicken = Ingredient.new("chicken")
broccoli = Ingredient.new("broccoli")
peanuts = Ingredient.new("peanuts")

bread = Recipe.new("bread")
pie = Recipe.new("pie")
soup = Recipe.new("soup")
cake = Recipe.new("cake")

bread.add_ingredients([milk, beans, salt])
pie.add_ingredients([milk, sugar, salt])
soup.add_ingredients([carrot, chicken, broccoli])
cake.add_ingredients([milk, peanuts, sugar])


ben = User.new("Ben")
crystal = User.new("Crystal")
kyle = User.new("Kyle")

ben.add_recipe_card(bread, 7, "03-18-19")
ben.add_recipe_card(pie, 12, "03-21-19")
ben.add_recipe_card(soup, 4, "03-05-19")
ben.add_recipe_card(cake, 3, "03-08-19")

crystal.add_recipe_card(bread, 9, "03-19-19")
crystal.add_recipe_card(pie, 4, "03-01-19")
crystal.add_recipe_card(soup, 10, "03-16-19")

kyle.add_recipe_card(pie, 9, "03-12-19")
kyle.add_recipe_card(soup, 10, "03-03-19")


ben.declare_allergen(milk)
crystal.declare_allergen(milk)
kyle.declare_allergen(peanuts)
ben.declare_allergen(peanuts)
crystal.declare_allergen(peanuts)


binding.pry
