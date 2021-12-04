class Number
    attr_accessor :number, :marked

    def initialize(number)
        @number = number
        @marked = false
    end
end

class Board
    attr_accessor :numbers, :finished

    def initialize(board_string)
        @numbers = []
        board_string.split("\n").each { |line| @numbers.push line.split(" ").map {|number| Number.new(number.to_i) } }
        @finished = false
    end

    def draw_number(drawn_number)
        numbers.each do |row|
            row.each do |number|
                number.marked = true if number.number == drawn_number
            end
        end

        bingo?
    end

    def bingo?
        @numbers.each do |row|
            number_row = row.map {|number| number.marked}
            if !number_row.include?(false)
                @finished = true
                return true
            end
        end

        @numbers.each_index do |column|
            bingo = true
            @numbers[column].each_index do |row|
                if !numbers[row][column].marked
                    bingo = false
                    break
                end
            end

            if bingo
                @finished = true
                return true
            end
        end

        return false
    end

    def calculate_board_sum
        sum = 0
        @numbers.each do |row|
            row.each do |number|
                if !number.marked
                    sum += number.number
                end
            end
        end

        sum
    end

end

def question_1(puzzle_input, boards)
    puzzle_input.each do |number|
        boards.each do |board|
            if board.draw_number(number)
                puts "Bingo!"
                return board.calculate_board_sum * number
            end
        end
    end
end

def question_2(puzzle_input, boards)
    puzzle_input.each do |number|
        boards.each do |board|
            if board.draw_number(number)
                if boards.select {|board| !board.finished}.count == 0
                    return board.calculate_board_sum * number
                end
            end

        end
    end
end

content = File.read("content4.txt").split("\n\n")

puzzle_input = []
boards = []

content.each_with_index do |element, index|
    if index == 0
        puzzle_input = element.split(",").map {|number| number.to_i}
    else
        boards.push Board.new(element)
    end
end

# Question 1 ##
puts "question1: #{question_1(puzzle_input, boards)}"
#

# Question 2 ##
puts "question2: #{question_2(puzzle_input, boards)}"
#