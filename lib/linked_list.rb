# frozen_string_literal: true

require_relative './node'
require_relative './invalid_index'

##
# A LinkedList
# Each node has a reference (next_node) to the next Node object!
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    else
      @tail.next_node = new_node
    end
    @tail = new_node
  end

  def prepend(value)
    new_node = Node.new(value)
    if @head.nil?
      @tail = new_node
    else
      new_node.next_node = @head
    end
    @head = new_node
  end

  def size
    size = 0
    each { size += 1 }
    size
  end

  def at(index)
    raise InvalidIndex if index.negative?

    node = @head
    index.times { node = node.next_node }
    node
  rescue NoMethodError
    raise InvalidIndex
  end

  def pop
    # Get last node
    node = @tail
    # Define new tail
    @tail = at(size - 2)
    @tail.next_node = nil
    node
  end

  def shift
    node = @head
    @head = at(1)
    node.next_node = nil
    node
  end

  def contains?(element)
    exists = false
    each do |node|
      break if exists

      exists = true if element == node.value
    end
    exists
  end

  def find(value)
    found = false
    current_index = 0
    each do |node|
      break if found

      found = true if node.value == value
      current_index += 1
    end
    found ? current_index : nil
  end

  def insert_at(value, index)
    return prepend(value) if index.zero?

    return append(value) if index == size

    node = Node.new(value)
    previous_node = at(index - 1)
    next_node = at(index)

    previous_node.next_node = node
    node.next_node = next_node
    node
  end

  def remove_at(index)
    node = at(index)
    return shift if index.zero?

    return pop if index == size

    # Update references in the list
    previous_node = at(index - 1)
    next_node = at(index + 1)
    previous_node.next_node = next_node
    node
  end

  def to_s
    string = ''
    each { |node| string += "( #{node.value} ) -> " }
    string += 'nil'
  end

  private

  # Iterates over each element of the LinkedList
  # Needs a block to be passed
  def each
    current_node = @head
    until current_node.next_node.nil?
      yield(current_node)
      current_node = current_node.next_node
    end
    yield(@tail)
  end
end
