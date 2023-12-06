input = File.read("input").split("\n\n")

def question1(rows)
    seeds = rows.shift.split(": ")[1].split(" ")

    maps = rows.map do |block|
        block.split("\n").each.map {|row| row.split(" ")}[1..]
    end
    locations = []
    seeds.each do |s|
        seed = s.to_i
        maps.each do |map|
            map.each do |row|
                if seed >= row[1].to_i && seed <= row[1].to_i + row[2].to_i
                    seed = seed - row[1].to_i + row[0].to_i
                    break
                end
            end
        end
        locations.push seed
    end
    locations.min
end

def question2(rows)
    location_placeholder = 0
    seeds = rows.shift.split(": ")[1].split(" ").map{|e| e.to_i}

    maps = rows.map do |block|
        block.split("\n").each.map {|row| row.split(" ").map{|e| e.to_i}}[1..]
    end.reverse

    while true
        location = location_placeholder
        maps.each do |map|
            map.each do |row|
                if location >= row[0] && location <= row[0] + row[2]
                    location = location - row[0] + row[1]
                    break
                end
            end
        end

        seeds.each_slice(2).each do |seed|
            if seed[0] <= location && seed[0] + seed[1] >= location
                return location_placeholder
            end
        end

        if location_placeholder % 1000000 == 0
            puts "At #{location_placeholder}"
        end

        location_placeholder += 1
    end
end

puts "Question 1: #{question1(input.clone)}"
time = Time.now
puts "Question 2: #{question2(input.clone)}"

puts "Duration: #{Time.now - time}s"