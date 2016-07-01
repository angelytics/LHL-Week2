require 'error'

class Robot

  MAX_CAPACITY = 250
  MAX_HEALTH = 100
  DEFAULT_DAMAGE = 5

  attr_reader :position, :items, :health
  attr_accessor :equipped_weapon

  def initialize
    @position = [0, 0]
    @items = []
    @health = MAX_HEALTH
    @hitpoints = 5
    @equipped_weapon = nil
  end
  
  def move_left
    @position[0] -= 1
  end
  
  def move_right
    @position[0] += 1
  end
  
  def move_down 
    @position[1] -= 1
  end
  
  def move_up
    @position[1] += 1
  end
  
  def pick_up(item)
    if item.kind_of?(Weapon)  # OR is_a?
      @equipped_weapon = item
    else
    @items << item if items_weight + item.weight <= MAX_CAPACITY
    end
  end
 
  def items_weight
    @items.reduce(0) { |total, item| total + item.weight }  # OR @items.inject(0)
  end
  
 
  def wound(damage)
    (@health  - damage) < 0 ? @health = 0 : @health -= damage
  end
  

  def heal(amount)
    (@health + amount) > MAX_HEALTH ? @health = MAX_HEALTH : @health += amount
  end
  
  def heal!
    (@health <= 0) ? ZeroExceptionError : @health
  end
  
=begin
# Alternate code for 

  def heal!
    @health <= 0 ? raise RobotAlreadyDeadError : @health

=end
 
  def attack(enemy)
    if enemy.is_a?(Robot)
      @equipped_weapon ? @equipped_weapon.hit(enemy) : enemy.wound(DEFAULT_DAMAGE)
    else
      raise RuntimeError
    end 
  end   
end

=begin
  def pick_up(item)
    total_weight = 0
	if items.length > 0
	  @items.each do |item|
	    total_weight += item.weight
	  end
	end
	total_weight
  end
  
  def health
    @health
  end
=end 

=begin
  def wound(damage)
    if (@health  - damage) < 0
      @health = 0
    else
      @health -= damage 
    end   
  end
=end  

=begin
  def heal!
    if (@health <= 0) 
      ZeroHealthError 
    else
      @health
    end
  end
=end 
 
=begin
  def heal(amount)
    if (@health  + amount) > 100
      @health = 100
    else
      @health += amount 
    end   
  end
=end 

  
=begin
    if @equipped_weapon
      @equipped_weapon.hit(enemy)
    else
      enemy.wound (5)  
    end
  end
=end  
   