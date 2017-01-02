require 'byebug'

class Triangle
    def initialize(lengths)
        @lengths = lengths.sort
        if !valid
            raise 'Invalid'
        end
    end

    private

    def valid
        return false if @lengths.length != 3
        return false if @lengths[2] >= @lengths[0] + @lengths[1]
        return true
    end
end
