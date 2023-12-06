input = File.read("input")

def question1(text)
    rows = text.gsub(/[a-z]/, "").split("\n")
    rows.sum {|row| "#{row[0]}#{row[-1]}".to_i}
end

def question2(text)
    replace = [["one", 1], ["two", 2], ["three", 3], ["four", 4], ["five", 5], ["six", 6], ["seven", 7], ["eight", 8], ["nine", 9], ["zero", 0]]
    replace.each do |word, number|
        text = text.gsub(/#{word}/, word + number.to_s + word) # Add the word again around the number to not influence other numbers (e.g. eightwo = 82)
    end

    rows = text.gsub(/[a-z]/, "").split("\n")
    rows.sum {|row| "#{row[0]}#{row[-1]}".to_i}
end

puts "Question 1: #{question1(input)}"
puts "Question 2: #{question2(input)}"