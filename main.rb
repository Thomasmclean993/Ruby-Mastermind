#!/bin/env ruby

COLORS = ["red", "blue", "yellow", "green", "purple", "black"]
MAX_ATTEMPTS = 12



def rand_num
    rand(6) + 1
end

def color_generator
    4.times.map { COLORS.sample}
end



def valid_input(user_input)
    user_input.each do |valid| 
        if  COLORS.include?(valid)
            
        else  
            puts " "*2
            puts user_input.difference(COLORS) 
            puts "^^^ This color/s are not an option. Try not to include them in your next guess."
        end
    end 
end

def code_reader(user_input, secret_code)
    user_input.zip(secret_code).map do |x, y| 
        if  x == y
            print "[O]"
        else 
            print "[X]"
        end
    end
end


#TODO: Greg's feedback. Better clear Feedback
#1st: have the program be able to repeat itself till you are correct or to max out the 12 turns 

puts "Welcome New Mastermind!!"
puts "The game is simple, Guess the code and you win. You will have 12 attempts."
puts "The code will be made up of four assorted colors."
puts "Red, yellow, green, purple, blue and black. As you guess the right color in the right slot,"
puts "I'll let you know if your correct. By giving you a hint for what colors are correct. Slowly but surely, Will reveal the color code."
puts "If I give you a white dot, then you have a color correct. A black dot, means on of the colors are in correct."
puts "First, what will be your first guess?? You will need to type in enter between each color. >>>"

secret_code = color_generator


    guess_slot1 = gets.chomp
    guess_slot2 = gets.chomp
    guess_slot3 = gets.chomp
    guess_slot4 = gets.chomp


user_guess = []
valid_guess = []


user_guess.push(guess_slot1, guess_slot2, guess_slot3, guess_slot4)



valid_input(user_guess)

print user_guess
print valid_input(user_guess)
print secret_code

if user_guess == secret_code
    print "congrats, You discovered the secret code"
else  
    print "Your wrong but check the hints in the next line below"
    puts " "
    print code_reader(user_guess, secret_code)
    
end 
