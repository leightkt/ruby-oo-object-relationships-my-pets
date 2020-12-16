class Owner
  # code goes here
  attr_reader :name, :species

  @@all = []

  def initialize(name, species="human")
    @name = name
    @species = species
    @@all << self
  end

  def self.all
    @@all 
  end

  def say_species
    p "I am a #{@species}."
  end

  def self.count
    all.count
  end

  def self.reset_all
    all.clear
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

    def buy_cat(name)
      Cat.new(name, self)
    end

    def buy_dog(name)
      Dog.new(name, self)
    end

    def walk_dogs
      dogs.each do |dog|
        dog.mood = "happy"
      end
    end

    def feed_cats
      cats.each do |cat|
        cat.mood = "happy"
      end
    end

    def sell_pets
      dogs.each do |dog|
        dog.mood = "nervous"
        dog.owner = nil
      end
      cats.each do |cat|
        cat.mood = "nervous"
        cat.owner = nil
      end
    end

    def list_pets
      p "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
    end

end