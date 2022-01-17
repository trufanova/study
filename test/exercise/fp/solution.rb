module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtered_films = array.reject { |film| film['country'].nil? }
                              .select { |film| film['country'].split(',').length > 1 }
                              .reject { |film| film['rating_kinopoisk'].to_f.zero? }
                              .map { |film| film['rating_kinopoisk'] }
        sum_rating = filtered_films.reduce { |sum, el| el.to_f + sum.to_f }
        sum_rating / filtered_films.length
      end

      def chars_count(films, threshold)
        films.select { |film| film['rating_kinopoisk'].to_f >= threshold }
             .map { |film| film['name'].scan('и').count }
             .sum
      end
    end
  end
end
