class Stack
  class EmptyStackException < Exception; end

  class Node
    attr_accessor :next, :value

    def initialize(value)
      @value = value
    end
  end

  def initialize
    @head = nil
  end

  def push(value)
    top = Node.new(value)
    top.next = @head
    @head = top
  end

  def pop
    raise EmptyStackException, "Can't pop an empty stack" if @head.nil?
    top = @head
    @head = top.next
    top.value
  end

  def peek
    raise EmptyStackException, "Can't peek an empty stack" if @head.nil?
    @head.value
  end

  def empty?
    @head.nil?
  end
end
