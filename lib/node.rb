# frozen_sring_literal: true

##
# A node for the LinkedList
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end
