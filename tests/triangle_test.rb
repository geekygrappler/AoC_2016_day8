require_relative "../lib/triangle.rb"
require "test/unit"

class TriangleTest < Test::Unit::TestCase
    def test_invalid_traingle_is_not_created
        assert_raise do
            Triangle.new([10, 5])
        end
        assert_raise do
            Triangle.new([10, 5, 25])
        end
    end

    def test_valid_triangle_is_created
        assert_not_nil(Triangle.new([3, 4, 5]))
    end
end
