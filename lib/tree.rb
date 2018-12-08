require_relative 'node'

class Tree

  def initialize
    @root = Node.new
  end

  def insert(route)
    node = @root

    elements_from(route).map { |word| node = node.insert(word) }
    node.term = true
  end

  def have?(route)
    node = @root

    elements_from(route).all? { |word| node = node.have?(word, node.children) } && node.term
  end

  private

  def elements_from(route)
    route.split('/').reject(&:empty?)
  end
end
