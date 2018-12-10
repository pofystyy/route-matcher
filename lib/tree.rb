require_relative 'node'

class Tree

  def initialize
    @root = Node.new
  end

  def insert(route, name)
    node = @root

    elements_from(route).each { |word| node = insert_word(word, node.children) }
    node.term = true
    node.name = name
  end

  def have?(route)
    node = @root

    elements_from(route).all? { |word| node = node.have?(word, node.children) } && node.term
  end

  private

  def elements_from(route)
    route.split('/').reject(&:empty?)
  end

  def insert_word(word, node_children)
    unless node_children.find { |elem| elem.value == word }
      @root.insert(word, node_children)
    end
  end
end
