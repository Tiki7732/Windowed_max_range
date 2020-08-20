def w_max1(array, window)
    current_max = nil
    array[0..array.length - window].each_with_index do |ele, ind|
        window_arr = array[ind...ind+window]
        window_arr.sort!
        min, max = window_arr.first, window_arr.last
        current_max = (max - min) if current_max.nil? || max - min > current_max
    end
    current_max
end
# O(n log n) time complexity
# O(n) space complexity

# p w_max1([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p w_max1([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p w_max1([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p w_max1([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

class MyQueue

    def initialize
        @store = []
    end

    def peek
        @store.first
    end

    def size
        @store.length
    end

    def empty?
        return true if @store.empty?
        false
    end

    def enqueue(ele)
        @store.push(ele)
    end

    def dequeue
        @store.shift
    end
end

class MyStack
    def initialize
        @store = []
    end

    def peek
        @store.last
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end

    def pop
        @store.pop
    end

    def push(ele)
        @store.push(ele)
    end
end

class StackQueue

    def initialize
        @in_stack = MyStack.new
        @out_stack = MyStack.new
    end

    def size
        @in_stack.size + @out_stack.size
    end

    def empty?
        @in_stack.emtpy? && @out_stack.emtpy?
    end

    def enqueue(ele)
        @in_stack.push(ele)
    end

    def dequeue
        reverse_stack if @out_stack.empty?
        @out_stack.pop
    end

    def reverse_stack
        @out_stack.push(@in_stack.pop) until @in_stack.empty?
    end
end

class MinMaxStack
    def initialize
        @store = MyStack.new
    end

    def peek
        @store.peek[:value] unless empty?
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end

    def max
        @store.peek[:max] unless empty?
    end

    def min
        @store.peek[:min] unless empty?
    end

    def push(ele)
        @store.push({min: new_min(ele),
                    value: ele,
                    max: new_max(ele)})
    end

    def new_max(ele)
        return ele if empty?
        ele > max ? ele : max
    end

    def new_min(ele)
        return ele if empty?
        ele < min ? ele : min
    end
end
# stack = MinMaxStack.new
# p stack.peek
# stack.push(5)
# stack.push(6)
# stack.push(7)
# p stack.peek
# p stack.min

# stack.push(12)
# stack.push(1)
# p stack.peek
# p stack.max
# p stack.min


class MinMaxStackQueue
    
    def initialize
        @in_stack = MinMaxStack.new
        @out_stack = MinMaxStack.new
    end

    def size
        @in_stack.size + @out_stack.size
    end

    def emtpy?
        @in_stack.empty? && @out_stack.emtpy?
    end

    def enqueue(ele)
        @in_stack.push(ele)
    end

end