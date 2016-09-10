require 'stack'

module QueueViaStacks
  class MyQueue
    class EmptyMyQueueException < Exception; end

    def initialize
      @newest = Stack.new
      @oldest = Stack.new
    end

    def add(value)
      if @newest.empty?
        until @oldest.empty? do
          @newest.push @oldest.pop
        end
      end

      @newest.push value
    end

    def remove
      if @oldest.empty?
        until @newest.empty? do
          @oldest.push @newest.pop
        end
      end

      @oldest.pop
    end

    def peek
      if @oldest.empty?
        until @newest.empty? do
          @oldest.push @newest.pop
        end
      end

      @oldest.peek
    end

    def empty?
      @newest.empty? && @oldest.empty?
    end
  end
end
