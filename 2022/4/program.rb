input = File.read("input").split("\n").map{|row| row.split(",").map {|group| group.split("-").map {|number| number.to_i}}}

answer1 = input.select {|row| (row[0][0] <= row[1][0] && row[0][1] >= row[1][1]) || (row[0][0] >= row[1][0] && row[0][1] <= row[1][1])}
answer2 = input.select {|row| (row[0][0] <= row[1][1] && row[1][0] <= row[0][1]) || (row[0][0] >= row[1][1] && row[1][0] >= row[0][1])}

puts "Answer1: #{answer1.count}"
puts "Answer2: #{answer2.count}"