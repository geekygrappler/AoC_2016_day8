require "byebug"
class Screen
    def initialize()
        @width = 50
        @height = 6
        @grid = create_grid
    end

    def voltage
        @grid.flatten.count("#")
    end

    def add_rect(x, y)
        y.times do |y|
            x.times do |x|
                @grid[y][x] = "#"
            end
        end
    end

    def rotate_column(x, displacement)
        displacement.times do
            shift_column(x)
        end
    end

    def rotate_row(y, displacement)
        displacement.times do
            shift_row(y)
        end
    end

    def pixel_at(x, y)
        @grid[y][x]
    end

    def print_screen
        @grid.each do |row|
            row.each do |element|
                print element
            end
            print "\n"
        end
    end

    private

    def create_grid
        Array.new(@height) { Array.new(@width, ".") }
    end

    def shift_column(x)
        buffer = @grid[@height-1][x]
        [*0...@height-1].reverse.each do |y|
            @grid[y+1][x] = @grid[y][x]
        end
        @grid[0][x] = buffer
    end

    def shift_row(y)
        @grid[y].unshift(@grid[y].pop)
    end
end
