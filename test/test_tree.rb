require 'minitest/autorun'
require_relative '../lib/tree'

class AppTest < Minitest::Test
  def setup
    @tree = Tree.new
    @tree.insert('/my/account/first/')
    @tree.insert('/ins/kjj/ikj')
  end

  def test_presented_route_should_be_true
    assert_equal true, @tree.have?('/my/account/first/')
  end

  def test_presented_route_v2_should_be_true
    assert_equal true, @tree.have?('/ins/kjj/ikj')
  end

  def test_missing_route_should_be_false
    assert_equal false, @tree.have?('/my/account')
  end
end
