require 'minitest/autorun'
require_relative '../lib/tree'

class AppTest < Minitest::Test
  def setup
    @tree = Tree.new
    @tree.insert('company/:id/:bp_id/reports/:report_id/', 'report_in_company_bp:')
    @tree.insert('/my/:fancy/route/page/:page', 'fancy_route:')
    @tree.insert('/country/:id', 'company')
  end

  def test_presented_route_should_be_true
    assert_equal true, @tree.have?('company/77/18/reports/22/')
  end

  def test_presented_route_v2_should_be_true
    assert_equal true, @tree.have?('/my/sort/route/page/08')
  end

  def test_missing_route_should_be_false
    assert_equal false, @tree.have?('/my/account')
  end
end
