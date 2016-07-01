# classical inheritance 

require_relative 'Flight'

class Animal
  
  attr_reader :vertebrate, :non_vertebrate 
  
  def initialize(vertebrate, non_vertebrate)
    @vertebrate = vertebrate
    @non_vertebrate = false
  end
  
  def all_animals
    puts "All animals are either vertebrates or non-vertebrates."
  end
end

class Mammals < Animal

  attr_reader :warm_blooded
  
  def initialize(vertebrate, non_vertebrate, warm_blooded)
    @warm_blooded = warm_blooded
    super(vertebrate, non_vertebrate)
  end
  
  def are_mammals
    puts "Humans belong to the Mammalian class."
  end
end

class Primates < Mammals

  attr_reader :fury
  
  def initialize(vertebrate, non_vertebrate, warm_blooded, furry)
    @furry = furry
    super(vertebrate, non_vertebrate, warm_blooded)
  end
  
  def are_primates(warm_blooded, furry)
    puts "Primates are #{warm_blooded} and have #{furry}."
  end
end

class Chimpanzee < Primates
  def common_primate
    puts "Chimpanzees are the most common primates."
  end
end

class Bats < Mammals

  include Flight
  
  def can_fly
    puts "Bats are the only mammals that can fly."
  end
end

class Amphibians < Animal

  attr_reader :cold_blooded
  
  def initialize(cold_blooded)
    @cold_blooded = cold_blooded
    super(vertebrate, non_vertebrate)
  end
end

class Frog < Amphibians
  def are_amphibians(cold_blooded)
    puts "Frogs are amphibians and #{cold_blooded} vertebrates."
  end
end

class Birds < Animal

  attr_reader :feathers
  
  def initialize(vertebrate, non_vertebrate, feathers)
    super(vertebrate, non_vertebrate)
    @feathers = feathers    
  end
  
  def birds_have(feathers)
    puts "Birds have #{feathers} which enable them to fly."
  end  
end

class Parrot < Birds

  include Flight

  attr_reader :voice
  
  def initialize(vertebrate, non_vertebrate, feathers, voice)
    super(vertebrate, non_vertebrate, feathers)
    @voice = voice  
  end
  
  def can_talk(voice)
    puts "Parrots are one type of bird that can learn how to #{voice}."
  end
end

polly = Parrot.new('vertebrate', false, 'feathers', 'talk')
puts polly.can_talk('talk')
polly.can_fly

daffy = Birds.new('vertebrate', false, 'feathers')
puts daffy.birds_have('feathers')

croakie = Frog.new('cold-blooded')
croakie.are_amphibians('cold-blooded')
croakie.all_animals

swinger = Chimpanzee.new('vertebrate', false, 'warm-blooded', 'furry')
swinger.common_primate

#flier = Bats.new
#flier.can_fly

flier = Bats.new('vertebrate', false, 'warm-blooded')
flier.can_fly
flier.are_mammals
flier.bat_fly

chuck = Animal.new('vertebrate', false)
chuck.all_animals
