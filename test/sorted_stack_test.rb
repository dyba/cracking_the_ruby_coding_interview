require 'test_helper'
require_relative '../lib/sorted_stack'

class TestSortedStack < Minitest::Test
  include SortedStack

  def test_descending_stack
    s = Stack.new
    s.push 1
    s.push 3
    s.push 5
    s.push 7
    s.push 9

    sorted = sorted_stack s

    assert_equal 1, sorted.pop
    assert_equal 3, sorted.pop
    assert_equal 5, sorted.pop
    assert_equal 7, sorted.pop
    assert_equal 9, sorted.pop
  end

  def test_ascending_stack
    s = Stack.new
    s.push 10
    s.push 8
    s.push 6
    s.push 4
    s.push 2

    sorted = sorted_stack s

    assert_equal 2, sorted.pop
    assert_equal 4, sorted.pop
    assert_equal 6, sorted.pop
    assert_equal 8, sorted.pop
    assert_equal 10, sorted.pop
  end

  def test_mixed_stack
    s = Stack.new
    s.push 10
    s.push 9
    s.push 8
    s.push 7
    s.push 6
    s.push 1
    s.push 2
    s.push 3
    s.push 4
    s.push 5

    sorted = sorted_stack s

    assert_equal 1, sorted.pop
    assert_equal 2, sorted.pop
    assert_equal 3, sorted.pop
    assert_equal 4, sorted.pop
    assert_equal 5, sorted.pop
    assert_equal 6, sorted.pop
    assert_equal 7, sorted.pop
    assert_equal 8, sorted.pop
    assert_equal 9, sorted.pop
    assert_equal 10, sorted.pop
  end

  def test_mixed_stack_reversed
    s = Stack.new
    s.push 1
    s.push 2
    s.push 3
    s.push 4
    s.push 5
    s.push 10
    s.push 9
    s.push 8
    s.push 7
    s.push 6

    sorted = sorted_stack s

    assert_equal 1, sorted.pop
    assert_equal 2, sorted.pop
    assert_equal 3, sorted.pop
    assert_equal 4, sorted.pop
    assert_equal 5, sorted.pop
    assert_equal 6, sorted.pop
    assert_equal 7, sorted.pop
    assert_equal 8, sorted.pop
    assert_equal 9, sorted.pop
    assert_equal 10, sorted.pop
  end

  def test_single_element_stack
    s = Stack.new
    s.push 6

    sorted = sorted_stack s

    assert_equal 6, sorted.pop
  end

  def test_weaving_stack
    s = Stack.new
    s.push 1
    s.push 2
    s.push 4
    s.push 3
    s.push 5
    s.push 6
    s.push 8
    s.push 7
    s.push 10
    s.push 9

    sorted = sorted_stack s

    assert_equal 1, sorted.pop
    assert_equal 2, sorted.pop
    assert_equal 3, sorted.pop
    assert_equal 4, sorted.pop
    assert_equal 5, sorted.pop
    assert_equal 6, sorted.pop
    assert_equal 7, sorted.pop
    assert_equal 8, sorted.pop
    assert_equal 9, sorted.pop
    assert_equal 10, sorted.pop
  end
end
