require_relative "lib/triangle.rb"
require 'byebug'

file = File.new("day3_input.txt")

triangles = []

file.each_line do |l|
    begin
        triangles << Triangle.new(l.split(" ").map! { |i| i.to_i })
    rescue
        next
    end
end

puts triangles.length
