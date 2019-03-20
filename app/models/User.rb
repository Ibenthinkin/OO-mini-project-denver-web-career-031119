class User

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def add_recipe_card(recipe, rating, date)
      RecipeCard.new(self, recipe, rating, date)
  end

  def declare_allergen(ingredient)
    Allergen.new(ingredient, self)
  end

  def find_cards
    RecipeCard.all.select{|card| card.user == self}
  end

  def recipe
    self.find_cards.map{|card| card.recipe}
  end


  def find_allergens
    Allergen.all.select{|allergen| allergen.user == self}
  end

  def allergens
    self.find_allergens.map{|allergen| allergen.ingredient}
  end

  def top_three_recipe
    #Hash[@@all.map{|recipe| [recipe, recipe.users.count]}].max_by{|k,v|v}[0]
    Hash[self.find_cards.map{|card| [card.recipe, card.rating]}]
      .sort_by{|k,v|v}
      .reverse[0..2]
      .map{|recipe, rating| recipe}
  end

  def most_recent_recipe
    self.find_cards.date.sort
  end



end
