require_relative '../config/environment'



def welcome 
    puts "Welcome to SuperWorld! Enter your name:"
    gets.chomp
 end
 
 def set_user(name)
     User.find_or_create_by(name: name)
 end
 
 def options
     puts "-find : Find a character in the database"
     puts "-add : Add a character to your favorites"
     puts "-delete : Remove character from your favorites"
     puts "-rate : Add/Update character ratings"
     puts "-favorites : See your favorite characters"
     puts "-strongest: See your strongest character"
     puts "-fastest: See your fastest character"
     puts "-smartest: See your smartest character"
 end
 
     
 
 def get_user_input
     puts "Enter a character name:"
     user_input = gets.strip
 end
 
 def runner
     name = welcome
     user = set_user(name)
     p user
     puts "What do you want to do???"
     options
     user_command = gets.strip.downcase
     case user_command
         when "find"
            name = get_user_input
            character = Character.find_by(name: name)
            p character
         when "add"
            name = get_user_input
            user.add_character_to_favorites(name)
         when "delete"
            name = get_user_input
            user.delete_from_favorites(name)
            
        end
 
     
 end
 
 runner
