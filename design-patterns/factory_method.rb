# frozen_string_literal: true

# create a class called Creator
class Creator
  def factory_method
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def some_operation
    product = factory_method
    result = "Creator: The same creator's code has just worked with #{product.operation}"
    puts result
  end
end

# create two classes that inherit from Creator
# first class
class ConcreteCreator1 < Creator
  def factory_method
    ConcreteProduct1.new
  end
end

# second class
class ConcreteCreator2 < Creator
  def factory_method
    ConcreteProduct2.new
  end
end

# create a class called Product
class Product
  def operation
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# create two classes that inherit from Product
# first class
class ConcreteProduct1 < Product
  def operation
    '{Result of the ConcreteProduct1}'
  end
end

# second class
class ConcreteProduct2 < Product
  def operation
    '{Result of the ConcreteProduct2}'
  end
end

def client_code(creator)
  puts 'Client: I\'m not aware of the creator\'s class, but it still works.'
  puts creator.some_operation
end

puts 'App: Launched with the ConcreteCreator1.'
client_code(ConcreteCreator1.new)
puts

puts 'App: Launched with the ConcreteCreator2.'
client_code(ConcreteCreator2.new)
