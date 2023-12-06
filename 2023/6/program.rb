def question1(matrix)
    possibilities = []

    matrix[0].each_with_index do |value, index|
        count = 0
        1.upto(value) do |time|
            distance = (value - time) * time
            distance_to_beat = matrix[1][index].to_i
            beaten = distance > distance_to_beat

            if beaten
                count += 1
            end
        end
        possibilities.push count
    end
    return possibilities.inject(:*)
end

input = File.read("example").split("\n").map{|e| e.split(": ")[1].split(" ").map {|f| f.to_i}}
puts "Question1: #{question1(input)}"

input = File.read("input2").split("\n").map{|e| e.split(": ")[1].split(" ").map {|f| f.to_i}}
puts "Question2: #{question1(input)}"