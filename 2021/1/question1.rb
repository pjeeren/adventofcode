content = File.read("content1.txt").split("\n").map {|number| number.to_i}
$print = false

def print(text)
    puts text if $print
end

def depth_counter(elements)
    counter = 0
    elements.each_with_index do |number, index|
        if index == 0
            print "#{number}: (N/A - no previous measurement)"
        else
            if number > elements[index - 1]
                counter += 1
                print "#{number}: (increased)"
            elsif number < elements[index - 1]
                print "#{number}: (decreased)"
            else
                print "#{number}: (no change)"
            end
        end
    end
    counter
end

## Question 1 ##
puts "question1: #{depth_counter(content).to_s}"
##

## question 2 ##
groups = content.each_with_index.map {|number, index| content[index - 2] + content[index - 1] + content[index] if index >= 2}.compact

puts "question2: #{depth_counter(groups).to_s}"
##
