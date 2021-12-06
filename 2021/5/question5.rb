class Line
    attr_accessor :coo_1, :coo_2, :points

    def initialize(line_string)
        @coo_1 = [line_string.split(" -> ")[0].split(",")[0].to_i, line_string.split(" -> ")[0].split(",")[1].to_i]
        @coo_2 = [line_string.split(" -> ")[1].split(",")[0].to_i, line_string.split(" -> ")[1].split(",")[1].to_i]

        calculate_points
    end

    def calculate_points
        @points = []
        x_coos = []
        y_coos = []
        if coo_1[0] == coo_2[0]
            x_coos = Array.new([coo_1[1], coo_2[1]].max - [coo_1[1], coo_2[1]].min + 1, coo_1[0])
        else
            if coo_1[0] < coo_2[0]
                coo_1[0].upto coo_2[0] do |x|
                    x_coos.push x
                end
            else
                coo_1[0].downto coo_2[0] do |x|
                    x_coos.push x
                end
            end
        end

        if coo_1[1] == coo_2[1]
            y_coos = Array.new([coo_1[0], coo_2[0]].max - [coo_1[0], coo_2[0]].min + 1, coo_1[1])
        else
            if coo_1[1] < coo_2[1]
                coo_1[1].upto coo_2[1] do |x|
                    y_coos.push x
                end
            else
                coo_1[1].downto coo_2[1] do |x|
                    y_coos.push x
                end
            end
        end

        if x_coos.size != y_coos.size
           raise "x and y are not equals"
        end

        x_coos.size.times do |index|
            @points.push [x_coos[index], y_coos[index]]
        end
    end
end

def calculate_dangerous_spots(lines)
    grid = Array.new
    1000.times {grid.push Array.new(1000, 0)}

    lines.each do |line|
        line.points.each do |point|
            grid[point[1]][point[0]] += 1
        end
    end

    grid.sum { |row| row.count {|point| point >= 2} }
end

content = File.read("content5.txt").split("\n")

# Question 1 ##
lines = content.map {|line| Line.new(line)}.select { |line| (line.coo_1[0] == line.coo_2[0] || line.coo_1[1] == line.coo_2[1])}
puts "question1: #{calculate_dangerous_spots(lines)}"
#

# Question 2 ##
lines = content.map {|line| Line.new(line)}
puts "question2: #{calculate_dangerous_spots(lines)}"
#