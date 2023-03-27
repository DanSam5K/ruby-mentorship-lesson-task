# frozen_string_literal: true

# create a class called Target
class Target
  def request
    puts "Target: The default target's behavior."
  end
end

# create a class called Adaptee
class Adaptee
  def specific_request
    puts 'Adaptee: (TRANSLATED) Specific request.'
  end
end

# create a class called Adapter
class Adapter < Target
  def initialize(adaptee)
    super()
    @adaptee = adaptee
  end

  def request
    puts 'Adapter: (TRANSLATED) Calling specific request.'
    @adaptee.specific_request
  end
end

def client_code(target)
  puts target.request
end

puts 'Client: I can work just fine with the Target objects:'
target = Target.new
client_code(target) # Target: The default target's behaviour

adaptee = Adaptee.new
puts 'Client: The Adaptee class has a weird interface. See, I don\'t understand it:'

puts adaptee.specific_request # Adaptee: (TRANSLATED) Specific request.

puts 'Client: But I can work with it via the Adapter:'
adapter = Adapter.new(adaptee)
client_code(adapter) # Adapter: (TRANSLATED) Calling specific request.
