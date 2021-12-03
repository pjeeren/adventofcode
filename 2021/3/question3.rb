content = File.read("content3.txt").split("\n")

def get_common(bit_sequences, position = 0, most = true)
    if most
        t = "0"
        f = "1"
    else
        t = "1"
        f = "0"
    end
    bit_sequences.count {|bit_sequence| bit_sequence[position] == "0"} > bit_sequences.size / 2 ? t : f
end

def get_gamma_rate(elements)
    elements[0].split("").map.with_index {|element, index| get_common(elements, index)}.join("")
end

def get_epsilon_rate(gamma_rate)
    gamma_rate.split("").map {|bit| ((bit.to_i * -1) + 1).to_s}.join("")
end

def get_oxygen(elements)
    0.upto elements[0].size do |bit_position|
        common = get_common(elements, bit_position)
        elements.select! {|line| line[bit_position] == common}

        return elements[0] if elements.size == 1
    end
end

def get_co2(elements)
    0.upto elements[0].size do |bit_position|
        common = get_common(elements, bit_position, false)
        elements.select! {|line| line[bit_position] == common}

        return elements[0] if elements.size == 1
    end
end

## Question 1 ##
gamma_rate = get_gamma_rate(content)
epsilon_rate = get_epsilon_rate(gamma_rate)

puts "question1: #{gamma_rate.to_i(2) * epsilon_rate.to_i(2)}"
##

## Question 2 ##
oxygen = get_oxygen(content.clone)
co2 = get_co2(content.clone)

puts "question2: #{oxygen.to_i(2) * co2.to_i(2)}"
##