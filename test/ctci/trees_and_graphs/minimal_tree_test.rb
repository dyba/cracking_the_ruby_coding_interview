require 'test_helper'
require 'ctci/trees_and_graphs/minimal_tree'

class TestMinimalTree < Minitest::Test
  include CTCI::TreesAndGraphs
  include CTCI::DataStructures

  def test_empty_array
    refute minimal_tree []
    refute minimal_tree nil
  end

  def test_single_element
    node = minimal_tree [1]

    assert_equal 1, node.value
    refute node.right
    refute node.left
  end

  def test_multiple_elements
    minimal_tree([*(1..5)]).tap do |node|
      assert_equal 3, node.value
      assert_equal 1, node.left.value
      assert_equal 2, node.left.right.value
      assert_equal 4, node.right.value
      assert_equal 5, node.right.right.value
    end

    minimal_tree([*(1..21)]).tap do |node|
      assert_equal 11, node.value

      assert_equal 16, node.right.value
      assert_equal 13, node.right.left.value
      assert_equal 19, node.right.right.value

      assert_equal 5, node.left.value
      assert_equal 2, node.left.left.value
      assert_equal 8, node.left.right.value
      assert_equal 6, node.left.right.left.value
      assert_equal 7, node.left.right.left.right.value
      assert_equal 9, node.left.right.right.value
      assert_equal 10, node.left.right.right.right.value
      assert_equal 1, node.left.left.left.value
      assert_equal 3, node.left.left.right.value
      assert_equal 4, node.left.left.right.right.value
    end
  end
end
