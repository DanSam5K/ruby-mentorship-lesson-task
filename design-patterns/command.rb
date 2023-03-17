# frozen_string_literal: true

# create a class called Command
class Command
  def execute
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# create two classes that inherit from Command
# simple command
class SimpleCommand < Command
  def initialize(payload)
    super()
    @payload = payload
  end

  def execute
    puts "SimpleCommand: See, I can do simple things like printing (#{@payload})"
  end
end

# complex command
class ComplexCommand < Command
  def initialize(receiver, first_val, second_val)
    super()
    @receiver = receiver
    @first_val = first_val
    @second_val = second_val
  end

  def execute
    puts 'ComplexCommand: Complex stuff should be done by a receiver object.'
    @receiver.do_something(@first_val)
    @receiver.do_something_else(@second_val)
  end
end

# create a class called Receiver
class Receiver
  def do_something(first_val)
    puts "\tReceiver: Working on (#{first_val}.)"
  end

  def do_something_else(second_val)
    puts "\tReceiver: Also working on (#{second_val}.)"
  end
end

# create a class called Invoker
class Invoker
  def initialize(on_start, on_finish)
    @on_start = on_start
    @on_finish = on_finish
  end

  def do_something_important
    puts 'Invoker: Does anybody want something done before I begin?'
    @on_start.execute if @on_start.is_a?(Command)

    puts 'Invoker: ...doing something really important...'
    puts 'Invoker: Does anybody want something done after I finish?'
    @on_finish.execute if @on_finish.is_a?(Command)
  end
end

receiver = Receiver.new
invoker = Invoker.new(SimpleCommand.new('Say Hi!'), ComplexCommand.new(receiver, 'Send email', 'Save report'))
invoker.do_something_important
