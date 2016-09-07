require 'test_helper'
require 'add_two_numbers'

class TestAddTwoNumbers < Minitest::Test

  include AddTwoNumbers

  def test_adds_two_numbers
    l1 = ListNode.new(2).tap { |l|
      l.next = ListNode.new(4).tap { |l|
        l.next = ListNode.new(3)
      }
    }

    l2 = ListNode.new(5).tap { |l|
      l.next = ListNode.new(6).tap { |l|
        l.next = ListNode.new(4)
      }
    }

    lresult = add_two_numbers l1, l2

    lresult.tap { |l|
      assert_equal 7, l.val

      l.next.tap { |l|
        assert_equal 0, l.val

        l.next.tap { |l|
          assert_equal 8, l.val

          assert_equal nil, l.next
        }
      }
    }
  end

  def test_lists_have_different_lengths_with_one_carry
    l1 = ListNode.new(7).tap { |n|
      n.next = ListNode.new(9)
    }
    l2 = ListNode.new(3)

    lresult = add_two_numbers l1, l2
    
    lresult.tap { |n|
      assert_equal 0, n.val

      n.next.tap { |n|
        assert_equal 0, n.val

        n.next.tap { |n|
          assert_equal 1, n.val

          assert_equal nil, n.next
        }
      }
    }
  end

  def test_lists_where_one_is_nil
    l1 = nil
    l2 = ListNode.new(3).tap { |n|
      n.next = ListNode.new(3)
    }

    result = add_two_numbers l1, l2

    result.tap { |n|
      assert_equal 3, n.val

      n.next.tap { |n|
        assert_equal 3, n.val
        assert_equal nil, n.next
      }
    }
  end

  def test_lists_have_length_one_no_carry
    l1 = ListNode.new(5)
    l2 = ListNode.new(1)

    lresult = add_two_numbers l1, l2

    assert_equal 6, lresult.val
  end

  def test_lists_have_length_one_with_carry
    l1 = ListNode.new(5)
    l2 = ListNode.new(5)

    lresult = add_two_numbers l1, l2

    lresult.tap { |l|
      assert_equal 0, l.val

      l.next.tap { |l|
        assert_equal 1, l.val

        assert_equal nil, l.next
      }
    }
  end
end
