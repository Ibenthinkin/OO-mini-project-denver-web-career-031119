class Recipe

  @@all = []
  attr_reader :name, :recipe_ingredients


  def initialize(name)
    @name = name
    @@all << self
    #@recipe_ingredients = []
  end

  def recipe_ingredients
    RecipeIngredient.all.select{|r_i| r_i.recipe == self}
  end

  def add_ingredients(ingredients_array)
    ingredients_array.each do |ingredient|
      RecipeIngredient.new(ingredient, self)
    end

  end

  def self.all
    @@all
  end

  def ingredients
    @recipe_ingredients.map{|r_i| r_i.ingredient}
  end

  def allergens
    self.ingredients.select{|ingredient| ingredient.is_allergen?}
  end

  def find_cards
    RecipeCard.all.select{|card| card.recipe == self}
  end

  def users
    self.find_cards.map{|card| card.user}
  end

  def self.most_popular
    Hash[@@all.map{|recipe| [recipe, recipe.users.count]}].max_by{|k,v|v}[0]
  end

end
