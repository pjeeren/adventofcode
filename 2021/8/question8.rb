def find_combination(input)
    numbers = Array.new(10, "")

    numbers[1] = input.select { |number| number.size == 2 }.first
    numbers[7] = input.select { |number| number.size == 3 }.first
    numbers[4] = input.select { |number| number.size == 4 }.first
    numbers[8] = input.select { |number| number.size == 7 }.first
    numbers[9] = input.select { |number| number.size == 6 && number.split("").difference(numbers[4].split("")).size == 2}.first
    numbers[0] = input.select { |number| number.size == 6 && number.split("").difference(numbers[7].split("")).size == 3 && number != numbers[9]}.first
    numbers[6] = input.select { |number| number.size == 6 && number != numbers[9] && number != numbers[0] }.first
    numbers[3] = input.select { |number| number.size == 5 && number.split("").difference(numbers[7].split("")).size == 2 }.first
    numbers[2] = input.select { |number| number.size == 5 && number.split("").difference(numbers[4].split("")).size == 3 }.first
    numbers[5] = input.select { |number| number.size == 5 && number != numbers[3] && number != numbers[2] }.first

    numbers
end

def find_decoded_value(combination, output)
    "#{combination.index(output[0])}#{combination.index(output[1])}#{combination.index(output[2])}#{combination.index(output[3])}".to_i
end

lines = File.read("content8.txt").split("\n").map do |line|
    [
        line.split(" | ")[0].split(" ").map { |number| number.chars.sort.join },
        line.split(" | ")[1].split(" ").map { |number| number.chars.sort.join }
    ]
end

# Question 1 ##
puts "question1: #{lines.sum {|line| line[1].count {|number| number.size == 2 || number.size == 3 || number.size == 4 || number.size == 7} }}"
#

# Question 2 ##
sum = lines.sum {|line| find_decoded_value(find_combination(line[0]), line[1])}

puts "question2: #{sum}"
#
