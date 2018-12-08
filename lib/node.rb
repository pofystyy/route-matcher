class Node

  attr_reader :value, :children
  attr_accessor :term

  def initialize(value = ' ')
    @value = value
    @term = false
    @children = []
  end

  def insert(word)
    child = Node.new(word)
    children << child
    child
  end

  def have?(word, node)
    node.find { |n| n.value == word }
  end
end
