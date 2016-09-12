require 'test_helper'
require 'ctci/linked_lists/palindrome'
require 'ctci/data_structures'

class TestPalindrome < Minitest::Test
  include CTCI::DataStructures
  include CTCI::LinkedLists

  def test_empty_list_not_a_palindrome
    refute palindrome? nil
  end

  def test_single_character_is_palindrome
    assert palindrome? SinglyLinkedNode.new('a')
  end

  def test_two_chars
    assert palindrome? SinglyLinkedNode.new('b').tap { |n| n.next = SinglyLinkedNode.new('b') }

    refute palindrome? SinglyLinkedNode.new('a').tap { |n| n.next = SinglyLinkedNode.new('b') }
  end

  def test_three_chars
    assert palindrome? SinglyLinkedNode.new('b').tap { |n| n.next = SinglyLinkedNode.new('a').tap { |n| n.next = SinglyLinkedNode.new('b') } }

    refute palindrome? SinglyLinkedNode.new('b').tap { |n| n.next = SinglyLinkedNode.new('a').tap { |n| n.next = SinglyLinkedNode.new('a') } }
  end

  def test_four_chars
    assert palindrome? SinglyLinkedNode.new('b').tap { |n| n.next = SinglyLinkedNode.new('a').tap { |n| n.next = SinglyLinkedNode.new('a').tap { |n| n.next = SinglyLinkedNode.new('b') } } }

    refute palindrome? SinglyLinkedNode.new('b').tap { |n| n.next = SinglyLinkedNode.new('a').tap { |n| n.next = SinglyLinkedNode.new('a').tap { |n| n.next = SinglyLinkedNode.new('c') } } }
  end

  def test_five_chars
    assert palindrome? SinglyLinkedNode.new('c').tap { |n| n.next = SinglyLinkedNode.new('a').tap { |n| n.next = SinglyLinkedNode.new('c').tap { |n| n.next = SinglyLinkedNode.new('a').tap { |n| n.next = SinglyLinkedNode.new('c') } } } }

    refute palindrome? SinglyLinkedNode.new('b').tap { |n| n.next = SinglyLinkedNode.new('a').tap { |n| n.next = SinglyLinkedNode.new('a').tap { |n| n.next = SinglyLinkedNode.new('c').tap { |n| n.next = SinglyLinkedNode.new('d') } } } }
  end
end
