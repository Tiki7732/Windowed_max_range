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

Class Myqueue

    def initialize
        @store = []
    end
end


p w_max1([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p w_max1([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p w_max1([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p w_max1([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8