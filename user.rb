#create a base class to extend from. 
# This class contains the code generator setter and getter methods that we'll be using.
class Base
  def self.getset(*args)
    args.each do |field|
      getter(field)
      setter(field)
    end
  end

  def self.getter(*args)
    args.each do |field|
      define_method(field) do
        instance_variable_get("@#{field}")
      end
    end
  end

  def self.setter(*args)
    args.each do |field|
      define_method("#{field}=") do |value|
        instance_variable_set("@#{field}", value)
      end
    end
  end
end

#create a class and utilize our getset generator
class Computer < Base
  # We'll create accessors
  getset :keyboard, :mouse, :monitor, :cpu, :ram, :hhd

  def initialize(keyboard, mouse,monitor,cpu,ram,hhd)
    self.keyboard = keyboard
    self.mouse  = mouse
    self.monitor=monitor
    self.cpu=cpu
    self.ram=ram
    self.hhd=hhd
  end
end

buddy = Computer.new("compaq", "razor","samsung","intel","5GB", "samsung")
# Let's call our methods and make sure they return what we expect
puts buddy.keyboard 
puts buddy.mouse 
puts buddy.monitor
puts buddy.cpu

# Let's see if our object responds to the new methods we created
puts buddy.respond_to?(:keyboard) 
puts buddy.respond_to?(:mouse=) 

