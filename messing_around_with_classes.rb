# Create a class called MyCar. When you initialize a new instance or object of 
# the class, allow the user to define some instance variables that tell us the
# year, color, and model of the car. Create an instance variable that is set 
# to 0 during instantiation of the object to track the current speed of the car
# as well. Create instance methods that allow the car to speed up, brake, and 
# shut the car off.

class MyCar
  attr_reader :year, :model
  attr_accessor :color

  def initialize(year=0, color="", model="")
    @year = year
    @color = color
    @model = model
    @speed = 0
    @on = false
  end

  def context
    self.instance_variables.map do |attribute|
      { attribute => self.instance_variable_get(attribute) }
    end
  end

  def accelerate(inc=0)
    if @on
      puts "accelerate from #{@speed} to #{@speed += inc}"
    end
  end

  def decelerate(dec=0)
    if @on
      puts "decelerate from #{@speed} to #{@speed -= dec}"
    end
  end

  def power
    if @speed != 0
      puts "You must come to a stop before turning off the car!"
    else
      @on = !@on
    end
  end

  def spray_paint(new_color)
    @color = new_color
  end
end

# https://www.eriktrautman.com/posts/ruby-explained-classes

class Person
  MAX_HEALTH = 120

  def initialize(name, age, health, health_max, strength)
    @name = name
    @age = age
    @health = health
    @health_max = health_max
    @strength = strength
  end

  def heal
    self.health += 1 unless self.health + 1 > @health_max
  end
end

class Viking < Person
  attr_accessor :health, :health_max, :strength
  attr_reader :name, :age

  @@WEAPONS = ["Axe", "Sword", "Mace"]

  def initialize(name, age, health, health_max, strength, weapon)
    super(name, age, health, health_max, strength)
    @weapon = weapon
  end

  def take_damage(damage)
    @health -= damage
    self.shout("OUCH")  # calls instance method
  end

  def shout(str)
    puts "#{@name}: '#{str}'"
  end

  def attack(enemy)
    puts "#{@name} attacks #{enemy.name}!"
    puts "#{enemy.name}'s health initial: #{enemy.health}"
    enemy.take_damage((@strength*(0.5 + 0.5*rand)).floor)
    puts "#{enemy.name}'s health now: #{enemy.health}"
  end

  def heal
    puts "#{@name}'s initial: health = #{@health}, health_max = #{@health_max}"
    if @health >= @health_max 
      puts "Already at max health!"
    else 
      2.times { super } # we use the super method here
      puts "#{@name} casts heal. Health: #{self.health}"
    end
  end

  # class method - instantiates new instance
  def self.create_warrior(name) 
    age = rand(20) + 15
    health = [age*5, MAX_HEALTH].min
    health_max = health
    strength = [age/2, 10].min
    Viking.new(name, age, health, health_max, strength, @@WEAPONS[rand(3)])
  end

end


x = Viking.create_warrior("x")
y = Viking.create_warrior("y")
x.attack(y)
puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
y.heal
