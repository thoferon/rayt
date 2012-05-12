require "rays"

class Animal
  def initialize(name)
    @name = name
  end

  def paint(colour)
    puts "The #{@name} is now #{colour}."
  end
end

Rays.define.the(:animal).is(:colour) do |args|
  args.animal.paint(args.colour)
end

cat = Animal.new "cat"
Rays.the(cat).is("blue") # will show "The cat is now blue."
