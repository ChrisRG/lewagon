require 'csv'

class BaseRepository
    def initialize(csv_path)
        @csv_path = csv_path
        @elements = []
        load_csv
        @next_id = @elements.empty? ? 1 : @elements.last.id + 1
    end

    def all
        @elements
    end

    def add(element)
        element.id = @next_id
        @next_id += 1
        @elements << element
        save_csv
    end

    def find(id)
        @elements.find { |element| element.id == id }
    end

    def delete(id)
        element = find(id)
        @elements.delete(element)
    end
end