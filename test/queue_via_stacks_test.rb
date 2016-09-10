require 'test_helper'
require_relative '../lib/queue_via_stacks'

class TestQueueViaStacks < Minitest::Test
  include QueueViaStacks

  def test_empty_queue
    q = MyQueue.new

    assert q.empty?
  end

  def test_removing_from_non_empty_queue
    q = MyQueue.new
    (1..5).each { |num| q.add num }

    assert_equal 1, q.remove
    assert_equal 2, q.remove
    assert_equal 3, q.remove
    assert_equal 4, q.remove
    assert_equal 5, q.remove
    assert q.empty?
  end

  def test_peeking_non_empty_queue
    q = MyQueue.new
    (1..10).step(2) { |num| q.add num }

    assert_equal 1, q.peek
    q.remove

    assert_equal 3, q.peek
    q.remove

    assert_equal 5, q.peek
    q.remove

    assert_equal 7, q.peek
    q.remove

    assert_equal 9, q.peek
    q.remove

    assert q.empty?
  end
end
