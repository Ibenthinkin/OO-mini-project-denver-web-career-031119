class Ingredient

  @@all = []
  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def all
    @@all
  end

  def is_allergen?
    !Allergen.all.find{|allergen| allergen.ingredient == self}.nil?
  end

  def self.most_common_allergen
    #Hash[Allergen.all.map{|allergen| [allergen, allergen.ingredient.count]}].max_by{|k,v|v}[0]
    arr = Allergen.all.map{|allergen| allergen.ingredient}

    counter = Hash.new(0)
    arr.each{|allergen| counter[allergen] +=1}
    counter.max_by{|k,v|v}[0]

  end
end
