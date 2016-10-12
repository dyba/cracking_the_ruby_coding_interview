require 'test_helper'
require 'ctci/linked_lists/reverse_list'
require 'ctci/data_structures'

class TestReverseList < Minitest::Test
  include CTCI::LinkedLists
  include CTCI::DataStructures

  def test_single_element
    node = SinglyLinkedNode.new(1)

    assert_equal 1, reverse_list(node).value

    refute reverse_list(node).next
  end

  def test_two_elements
    node = SinglyLinkedNode.new(1)
    node.next = SinglyLinkedNode.new(2)

    reversed = reverse_list(node)

    assert_equal 2, reversed.value
    assert_equal 1, reversed.next.value

    refute reversed.next.next
  end

  def test_several_elements
    node = SinglyLinkedNode.new(1)
    node.next = SinglyLinkedNode.new(3)
    node.next.next = SinglyLinkedNode.new(5)
    node.next.next.next = SinglyLinkedNode.new(7)
    node.next.next.next.next = SinglyLinkedNode.new(9)

    reversed = reverse_list(node)

    assert_equal 9, reversed.value
    assert_equal 7, reversed.next.value
    assert_equal 5, reversed.next.next.value
    assert_equal 3, reversed.next.next.next.value
    assert_equal 1, reversed.next.next.next.next.value

    refute reversed.next.next.next.next.next
  end
end
