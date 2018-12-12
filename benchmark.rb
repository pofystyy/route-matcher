require_relative './lib/tree'

require 'benchmark'

tree = Tree.new

arr    = ["foo", "bar", "baz", "qux", "quux", "corge", "grault", "garply"]
paths  = arr.permutation(3).map { |a| "/#{a.join '/'}" }
paths.each do |path|
  tree.insert("#{path}")
end

p Benchmark.realtime { 1_000.times { tree.have?('grault/qux/baz') }}
