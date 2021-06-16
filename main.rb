#!/bin/env ruby
require_relative 'Mastermind'
#TODO:start using classes and create a morn function code 
#Current: Add smart logic. The computer should be able to guess one of the colors in the correct spot, then ruby should know to keep the color. 
#DONE: Once the program works and you add a computer guess generator
#Note: If marked with # after code,you can active during troubleshooting. 

#DONE: Figure out a way to stop the program part way
#DONE:Greg's feedback. Better clear Feedback [Done]
#DONE: have the program be able to repeat itself till you are correct or to max out the 12 turns [Done]
#DONE:Will need to add an input method to fix the DRY => gets.chomp later in the program



game = Mastermind.new 
game.play 

