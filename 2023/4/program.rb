input = File.read("input").split("\n")

def question1(text)
    intersections = text.map do |line|
        game = [line.split(": ")[1].split(" | ").first.split(" ").delete_if{|e| e == " "}, line.split(": ")[1].split(" | ")[1].split(" ").delete_if{|e| e == " "}]
        game[0].intersection(game[1])
    end
    sum = 0
    intersections.each do |intersection|
        if intersection.size > 0
            sum +=  2 ** (intersection.size - 1)
        end
    end

    return sum
end

def question2(text)
    card_count = Hash.new
    text.each do |line|
        card_count[line.split(": ")[0].split(" ")[1].to_i] = 1
    end

    text.each_with_index do |line, index|
        game = [line.split(": ")[1].split(" | ").first.split(" ").delete_if{|e| e == " "}, line.split(": ")[1].split(" | ")[1].split(" ").delete_if{|e| e == " "}]
        intersections = game[0].intersection(game[1]).count

        1.upto(card_count[index + 1]) do
            1.upto(intersections) do |i|
                card_count[index + i + 1] = card_count[index + i + 1] + 1
            end
        end
    end
    card_count.sum {|card| card[1]}
end

puts "question1: #{question1(input)}"
puts "question2: #{question2(input)}"