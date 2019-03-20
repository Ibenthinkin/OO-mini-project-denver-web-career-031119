class RecipeCard
  require 'date'

  @@all = []

  attr_reader :user, :recipe
  attr_accessor :rating, :date

  def initialize(user, recipe, rating, date)
    @user = user
    @recipe = recipe
    @rating = rating
    @date = Date.strptime(date, "%m-%d-%y")
    @@all << self
  end

  def self.all
    @@all
  end





end
