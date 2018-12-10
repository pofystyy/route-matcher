require 'pry'

class Node

  attr_reader :value, :children
  attr_accessor :term

  def initialize(value = ' ')
    @value = value
    @term = false
    @children = []
  end

  def insert(word, node_children)
    Node.new(word).tap { |new_node| node_children << new_node }
  end

  def have?(word, node)
    node.find { |n| n.value == word }
  end
end
