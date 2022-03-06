# frozen_string_literal: true

##
# Custom Exception when accessing invalid index on LinkedList
class InvalidIndex < StandardError
  def initialize(msg = 'Index not exists')
    super
  end
end
