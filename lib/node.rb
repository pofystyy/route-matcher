class Node

  attr_reader :value, :children
  attr_accessor :term, :name

  def initialize(value = ' ')
    @value    = value
    @term     = false
    @children = []
  end

  def insert(word, node_children)
    Node.new(word).tap { |new_node| node_children << new_node }
  end

  def have?(word, node)
    node.find { |value| value.pattern?(word) }
  end

  def pattern?(word)
    value[0] == ':' ? hsh(word) : value == word
  end

  def hsh(word)
    key = value[1..-1]

    { "#{key}": word }
  end
end
