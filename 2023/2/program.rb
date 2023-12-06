input = File.read("input")

def question1(text)
    game_number = 0
    valid = true

    text = text.gsub(/;/, ",")
    text = text.gsub(/:/, ",")

    text.split("\n").sum do |row|
        valid = true
        row.split(", ").each do |part|
            if part.include?("Game")
                game_number = part.split(" ")[1].to_i
            end
            if part.include?("blue")
                if part.split(" ").first.to_i > 14
                    valid = false
                end
            end
            if part.include?("red")
                if part.split(" ").first.to_i > 12
                    valid = false
                end
            end
            if part.include?("green")
                if part.split(" ").first.to_i > 13
                    valid = false
                end
            end
        end
        if valid
            game_number
        else
            0
        end
    end
end

def question2(text)
    game_number = 0
    valid = true

    text = text.gsub(/;/, ",")
    text = text.gsub(/:/, ",")

    text.split("\n").sum do |row|
        blue_red_green = [0, 0, 0]
        row.split(", ").each do |part|
            if part.include?("blue")
                if part.split(" ").first.to_i > blue_red_green[0]
                    blue_red_green[0] = part.split(" ").first.to_i
                end
            end
            if part.include?("red")
                if part.split(" ").first.to_i > blue_red_green[1]
                    blue_red_green[1] = part.split(" ").first.to_i
                end
            end
            if part.include?("green")
                if part.split(" ").first.to_i > blue_red_green[2]
                    blue_red_green[2] = part.split(" ").first.to_i
                end
            end
        end
        blue_red_green[0] * blue_red_green[1] * blue_red_green[2]
    end
end

puts "Question 1: #{question1(input)}"
puts "Question 2: #{question2(input)}"