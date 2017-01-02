require_relative "../lib/screen.rb"
require "test/unit"
require "byebug"


class ScreenTest < Test::Unit::TestCase
    def setup
        @screen = Screen.new()
    end

    def test_screen_is_initialized
        assert_not_nil(@screen)
        assert_equal(0, @screen.voltage)
    end

    def test_add_rect
        @screen.add_rect(5, 5)
        assert_equal(25, @screen.voltage)
        assert_equal("#", @screen.pixel_at(4, 4))
    end

    def test_rotate_column
        @screen.add_rect(5, 5)
        @screen.rotate_column(1, 1)
        assert_equal(".", @screen.pixel_at(1, 0))
        assert_equal("#", @screen.pixel_at(1, 5))
    end

    def test_rotate_column_off_edge
        @screen.add_rect(5,5)
        @screen.rotate_column(1, 3)
        assert_equal(".", @screen.pixel_at(1, 2))
    end

    def test_rotate_row
        @screen.add_rect(5,5)
        @screen.rotate_row(0, 1)
        assert_equal(".", @screen.pixel_at(0, 0))
        assert_equal("#", @screen.pixel_at(5, 0))
    end

    def test_rotate_row_off_edge
        @screen.add_rect(5,5)
        @screen.rotate_row(0, 46)
        assert_equal("#", @screen.pixel_at(0, 0))
        assert_equal(".", @screen.pixel_at(1, 0))
    end
end
