require 'rubygems'
require 'ruby2ruby'
require 'ruby_parser'


processor = RubyParser.new
result = processor.parse('a = "hello"')
puts result.inspect



say_hello = proc {puts 'hello'}
puts Ruby2Ruby.translate(say_hello)

