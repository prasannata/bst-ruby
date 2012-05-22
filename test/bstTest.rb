#!/usr/bin/ruby

require "#{File.dirname(__FILE__)}/../src/bst"
require "test/unit"

class BstTest < Test::Unit::TestCase
  def setup
  @bst = BST.new
  @numbers = [5, 15, 51, 21, nil, 101, 1, -20, 51]
  @expectedOrder = [-20, 1, 5, 15, 21, 51, 101]
  end

  def teardown
  end

  def testBst
    add

    assertWalk

    assertSearch
  end

  def add
    @numbers.each do |num|
      @bst.add(num)
    end
  end

  def assertWalk
    elements = @bst.walk
    count = 0

    assert_equal(@expectedOrder.length, elements.length)
    elements.each do |element|
      assert_equal(@expectedOrder.at(count), element.value) 
      count = count + 1
    end

  end

  def assertSearch
    node = @bst.search(5) 
    assert_equal(5, node.value)
    assert_equal(nil, @bst.search(10))   
  end

  private :add, :assertWalk, :assertSearch
end

