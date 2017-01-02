require_relative "lib/screen.rb"
require 'byebug'

file = File.new("day8_input.txt")
screen = Screen.new()

file.each_line do |l|
    commands = l.split(" ")
    command = commands.shift
    if command == "rect"
        size = commands.shift.split("x")
        screen.add_rect(size.shift.to_i, size.shift.to_i)
    elsif command == "rotate"
        direction = commands.shift
        arguments = commands.select { |x| x != "by" }
        if direction == "row"
            screen.rotate_row(arguments.shift.split("=").last.to_i, arguments.shift.to_i)
        elsif direction == "column"
            screen.rotate_column(arguments.shift.split("=").last.to_i, arguments.shift.to_i)
        end
    end
end

screen.print_screen
puts screen.voltage
