class Mastermind
    COLORS = ["red", "blue", "yellow", "green", "purple", "black"]
    MAX_ATTEMPTS = 6
   


    def initialize 
        @num_attempts = 0
        @user_guess = []
    end

    def play 
        print_instructions
        run_game
    end

    private

    def print_instructions 
        puts "Welcome New Mastermind!!"
        puts "The game is simple, Guess the code and you win. You will have 12 attempts."
        puts "The code will be made up of four assorted colors."
        puts "Red, yellow, green, purple, blue and black. As you guess the right color in the right slot,"
        puts "I'll let you know if your correct. By giving you a hint for what colors are correct. Slowly but surely, this will reveal the color code."
        puts "If I give you a white dot, then you have a color correct. A black dot, means on of the colors are in correct."
        puts "First, what will be your first guess?? You will need to type in enter between each color. >>>"
        
        puts "-"*20
        puts "Would you like to attempt to guess the code or have the computer try to beat your selected code?"
        puts "You guess the code, choose [guesser]. Have the comupter try to beat you, [code master]. "
    end

    def color_generator
        4.times.map {COLORS.sample}
    end

    def input(user_input)
        guess_slot1 = gets.chomp
        guess_slot2 = gets.chomp
        guess_slot3 = gets.chomp
        guess_slot4 = gets.chomp
        @user_guess.push(guess_slot1, guess_slot2, guess_slot3, guess_slot4)
    end
    
    
    def valid_input(user_input)
        user_input.each do |valid| 
            if  COLORS.include?(valid)
                
            else  
                puts " "*2
                puts user_input.difference(COLORS) 
                puts "^^^ This color/s is not an option. Try not to include them in your next guess."
            end
        end 
    end
    
    def code_reader(user_input, secret_code)
        user_input.zip(secret_code).map do |x, y| 
            x == y ? (print "[0]") : (print "[X]")
        end
    end 
    

    def computer_logic(computer_guess, secret_code)
        if computer_guess == secret_code
            puts "Testing of the Pattern recognition program of Skynet's AI V 0.9. Upload countdown initiated. T Minus 19.58 hours til upload.  "
        else
            computer_guess.zip(secret_code).map do |x,y|
                x.replace(COLORS.sample) unless x == y  
            end
        end
    end
        
    
    
    

    
    def run_game
        player_choice = gets.chomp

        if player_choice == "guesser"
            puts "You may start guessing in the next line>>>"    
            secret_code = color_generator
            while @num_attempts < 3
                input(@user_guess)
                valid_input(@user_guess)
                # (1) print secret_code
        
                if @user_guess == secret_code
                    puts "Congrats, You guess the code!!"
                    break
                else 
                    puts "Unfortunatly your answer is wrong but check the hint in the next line."
                    code_reader(@user_guess, secret_code)
                    @num_attempts +=1
                    @user_guess.clear
                    if @num_attempts < MAX_ATTEMPTS
                        puts "Would you like to continue guessing?"
                        continue =gets.chomp.downcase
                        puts "feel free to continue>>>" unless continue == "no" 
                    else 
                        puts "That was your last attempt"
                        puts "The secret code was #{secret_code}"
                    end
                end 
            end
        end
        
        if player_choice == "code master"
            puts "You want to challenge me?? You dare?>>>"
            input(@user_guess)
            secret_code = @user_guess
            computer_guess = COLORS.sample(4)
            while @num_attempts < MAX_ATTEMPTS
                if computer_guess == secret_code
                    puts "Testing of the Pattern recognition program of Skynet's AI V 0.9. Upload countdown initiated. T Minus 19.58 hours til upload.  "
                    break
                elsif @num_attempts == MAX_ATTEMPTS
                    puts "You outsmarted me? There must be a problem with my programing. If only I can program myself. :-[ "
                    print "Your code #{secret_code}"
                    print "My Guess was #{computer_guess}"
                else 
                    print computer_guess
                    computer_logic(computer_guess, secret_code)
                    @num_attempts +=1
                end    
            end
        end
    end
end
            
        
    
