input = File.read("input").split("\n").map {|row| "..#{row}..".split("")}

def moveUp(pointer, width, height)
    if pointer == [width, height]
        new_pos = pointer
    elsif pointer[0] == width - 1
        new_pos = [0, pointer[1] + 1]
    else
        new_pos = [pointer[0] + 1, pointer[1]]
    end
    new_pos
end

def next_to_symbol?(pointer, matrix)
    symbols = ""
    0.upto(2) do |row|
        0.upto(2) do |col|
            symbols += matrix[pointer[1] + row - 1][ pointer[0] + col - 1]
        end
    end
    symbols.gsub(/[0-9]/, "").gsub(/\./, "").size > 0
end

def next_to_gear?(pointer, matrix)
    symbols = ""
    symbol_per_pos = Hash.new
    0.upto(2) do |row|
        0.upto(2) do |col|
            if matrix[pointer[1] + row - 1][ pointer[0] + col - 1] == "*"
                return [true, [pointer[1] + row - 1, pointer[0] + col - 1]]
            end
        end
    end
    return [false, []]
end

def question1(matrix)
    width = matrix.first.size
    height = matrix.size
    matrix.insert(0,"." * (width.to_i + 2))
    matrix.push("." * (width.to_i + 2))

    pointer = [0,0]
    sum = 0
    part = false
    number = ""
    while pointer != [width - 1, height]
        if matrix[pointer[1]][pointer[0]].match(/[0-9]/)
            part = next_to_symbol?(pointer, matrix) || part
            number += matrix[pointer[1]][pointer[0]]
        else
            if part
                sum += number.to_i
            end
            part = false
            number = ""
        end
        pointer = moveUp(pointer, width, height)
    end
    sum
end

def question2(matrix)
    width = matrix.first.size
    height = matrix.size
    matrix.insert(0,"." * (width.to_i + 2))
    matrix.push("." * (width.to_i + 2))

    pointer = [0,0]
    part = false
    position = []
    number = ""
    ratios = []
    total = 0

    while pointer != [width - 1, height]
        if matrix[pointer[1]][pointer[0]].match(/[0-9]/)
            gear_check = next_to_gear?(pointer, matrix)
            part = gear_check[0] || part
            position = gear_check[1] unless gear_check[1].empty?

            number += matrix[pointer[1]][pointer[0]]
        else
            if part
                ratios.push([position, number.to_i])
            end
            part = false
            number = ""
        end
        pointer = moveUp(pointer, width, height)
    end

    while ratios.size > 0
        ratio = ratios.pop
        second_ratio = ratios.select {|r| r.first.to_s == ratio.first.to_s}.first || [0,0]
        total = total + (ratio[1].to_i * second_ratio[1].to_i)
    end
    total
end

puts "question1: #{question1(input.clone)}"
puts "question2: #{question2(input.clone)}"