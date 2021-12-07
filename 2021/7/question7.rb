content = File.read("content7.txt").split(",").map {|number| number.to_i}

def calculate_fuel_consumption(steps)
    steps * (steps + 1) / 2
end

def calculate_lowest_fuel_consumption(numbers, question1 = true)
    fuel_consumptions = []
    numbers.min.upto numbers.max do |i|
        fuel_consumptions.push numbers.sum {|number| (number - i).abs} if question1
        fuel_consumptions.push numbers.sum {|number| calculate_fuel_consumption((number - i.abs).abs)} if !question1
    end
    fuel_consumptions.min
end

# Question 1 ##
puts "question1: #{calculate_lowest_fuel_consumption(content)}"
#

# Question 2 ##
puts "question2: #{calculate_lowest_fuel_consumption(content, false)}"
#