input = File.read("input")
            .split("\n\n")
            .map { |one_elf| one_elf.split("\n").map {|s| s.to_i}.sum }
            .max(3)

puts "Answer 1: #{input.first}"
puts "Answer 2: #{input.sum}"
