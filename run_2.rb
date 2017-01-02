require_relative "lib/triangle.rb"
require 'byebug'

file = File.new("day3_input.txt")

triangles = []

lines = []

file.each_line do |l|
    lines << l.split(" ").map! { |i| i.to_i }
    if lines.length == 3
        3.times do |index|
            begin
                triangles << Triangle.new([lines[0][index], lines[1][index], lines[2][index]])
            rescue
                next
            end
        end
        lines = []
    end
end

puts triangles.length
