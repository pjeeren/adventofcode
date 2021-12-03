content = File.read("content2.txt").split("\n").map {|line| [line.split(" ")[0], line.split(" ")[1].to_i]}

def get_position(elements)
    pos_horizontal = 0
    pos_depth = 0
    pos_depth_aim = 0
    aim = 0

    elements.each do |element|
        case element[0]
        when "forward"
            pos_horizontal += element[1]
            pos_depth_aim += (aim * element[1])
        when "up"
            pos_depth -= element[1]
            aim -= element[1]
        when "down"
            pos_depth += element[1]
            aim += element[1]
        else
            raise "command #{element[0]} is not known"
        end
    end
    {
        :question1 => pos_horizontal * pos_depth,
        :question2 => pos_horizontal * pos_depth_aim
    }
end
positions = get_position content
## Question 1 ##
puts "question1: #{positions[:question1]}"
##

## Question 2 ##
puts "question2: #{positions[:question2]}"
##