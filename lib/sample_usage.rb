# frozen_string_literal: true

require_relative './linked_list'

# Sample usages
my_list = LinkedList.new
my_list.append('a')         # => (a) -> nil
my_list.append('b')         # => (a) -> (b) -> nil
my_list.prepend('prepend')  # => (prepend) -> (a) -> (b) -> nil
my_list.append('c')         # => (prepend) -> (a) -> (b) -> (c) -> nil
my_list.prepend('first')    # => (first) -> (prepend) -> (a) -> (b) -> (c) -> nil
my_list.append('last')      # => (first) -> (prepend) -> (a) -> (b) -> (c) -> (last) -> nil

my_list.pop.value           # => last
my_list.shift.value         # => first

my_list.insert_at('3', 3)   # => (prepend) -> (a) -> (b) -> (3) -> (c) -> nil
my_list.remove_at(3)        # => (prepend) -> (a) -> (b) -> (c) -> nil

my_list.contains?('last')   # => false
my_list.find('h')           # => nil
