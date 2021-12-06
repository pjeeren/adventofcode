fishes = File.read("content6.txt").split(",").map {|number| number.to_i}

def calculate_fish_population_after_days(number_of_days, fishes)
    fishes_per_timer = [
        fishes.count(0),
        fishes.count(1),
        fishes.count(2),
        fishes.count(3),
        fishes.count(4),
        fishes.count(5),
        fishes.count(6),
        fishes.count(7),
        fishes.count(8)
    ]

    number_of_days.times do
        fishes_per_timer = [
            fishes_per_timer[1],
            fishes_per_timer[2],
            fishes_per_timer[3],
            fishes_per_timer[4],
            fishes_per_timer[5],
            fishes_per_timer[6],
            fishes_per_timer[0] + fishes_per_timer[7],
            fishes_per_timer[8],
            fishes_per_timer[0]
        ]
    end

    fishes_per_timer.sum {|fish_per_timer| fish_per_timer}
end

# Question 1 ##
puts "question1: #{calculate_fish_population_after_days(80, fishes.clone)}"
#

# Question 2 ##
puts "question2: #{calculate_fish_population_after_days(256, fishes.clone)}"
#