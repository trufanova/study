module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        return if empty?

        first, *rest = self
        yield first
        MyArray.new(rest).my_each(&block)
        self
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new
        my_each { |el| result.push(yield(el)) }
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) { |acc, element| element.nil? ? acc : acc << element }
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        my_each { |item| acc = acc.nil? ? item : yield(acc, item) }
        acc
      end
    end
  end
end
