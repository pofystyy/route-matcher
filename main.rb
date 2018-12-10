require_relative './lib/tree'

tree = Tree.new

tree.insert('/:my/account/:page', 'name')
p tree.have?('/my/account/:page')
