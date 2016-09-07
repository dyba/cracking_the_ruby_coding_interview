module AddTwoNumbers
  class ListNode
    attr_accessor :val, :next

    def initialize(val)
      @val = val
      @next = nil
    end
  end

  def add_two_numbers(l1, l2)
    dummy = ListNode.new(0)
    runner = dummy
    carry = 0

    until l2.nil? && l1.nil? do
      sum = l1.val + l2.val + carry
      carry = sum / 10
      digit = sum % 10

      runner.next = ListNode.new(digit)

      runner = runner.next
      l1 = l1.next
      l2 = l2.next
    end

    if carry == 1
      runner.next = ListNode.new(carry)
    end

    dummy.next
  end

  def add_two_numbers(l1, l2)
    return l2 unless l1
    return l1 unless l2

    carry = 0
    result = ListNode.new(0)
    runner = result

    until l1.nil? && l2.nil?
      sum = carry
      sum += l1.val if l1
      sum += l2.val if l2

      digit = sum % 10
      carry = sum / 10

      runner.next = ListNode.new(digit)

      runner = runner.next
      l1 = l1.next if l1
      l2 = l2.next if l2
    end

    unless carry.zero?
      runner.next = ListNode.new(carry)
    end

    result.next
  end
end
