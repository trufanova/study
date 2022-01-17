module Exercise
  module Arrays
    class << self
      def get_max(array)
        max = array[0]
        for el in array do
          max = el if el > max
        end
        max
      end

      def replace(array)
        max = get_max(array)
        array.map { |el| el.positive? ? max : el }
      end

      def search(array, query)
        return -1 if array.length.zero? || query < array.first || query > array.last

        mid = array.count / 2
        if query == array[mid]
          mid
        elsif query < array[mid]
          search(array[0..mid - 1], query)
        elsif query > array[mid]
          search(array[mid + 1..], query) + mid + 1
        end
      end
    end
  end
end
