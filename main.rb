require_relative './lib/tree'

tree = Tree.new

tree.insert('/my/account/:page')
p tree.have?('/my/account/:page')


