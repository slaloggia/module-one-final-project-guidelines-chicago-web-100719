require_relative '../config/environment'



def welcome 
    puts "Welcome to SuperWorld! Enter your name:"
    puts "\n"
    gets.chomp
end

def exit_app
    puts "Until next time...EXCELSIOR!!!"
end
 
def set_user(name)
    User.find_or_create_by(name: name)
end
 
def options
    puts "***MENU***"
    puts "-find : Find a character in the database"
    puts "-add : Add a character to your favorites"
    puts "-delete : Remove character from your favorites"
    puts "-rate : Add/Update character ratings"
    puts "-favorites : See your favorite characters"
    puts "-publisher : Finds your favorite publisher"
    puts "-strongest : See your strongest character"
    puts "-fastest : See your fastest character"
    puts "-smartest : See your smartest character"
    puts "-menu : View this menu"
    puts "-exit : Exits the program" 
    puts "\n"
end
 
 
     
 
def get_user_input
    puts "Enter a character name:"
    user_input = gets.strip
end
 
def runner
    name = welcome
    user = set_user(name)
    p user
    puts "\n"
    user_command = nil
    options
    until user_command == "exit"
        puts "What do you want to do???\n"
        user_command = gets.strip.downcase
    case user_command
        when "find"
        name = get_user_input.split.map(&:capitalize).join(' ')
        character = Character.find_by(name: name)
        p character 
        when "add"
        name = get_user_input.split.map(&:capitalize).join(' ')
        user.add_character_to_favorites(name)
        puts "\n"
        when "delete"
        name = get_user_input.split.map(&:capitalize).join(' ')
        user.delete_from_favorites(name)
        puts "\n"
        when "rate"
        name = get_user_input.split.map(&:capitalize).join(' ')
        puts "Enter a rating for this character \n"
        rating = gets.chomp
        user.update_character_rating(name, rating)
        puts "\n"
        when "favorites"
        user.favorite_characters_names  
        puts "\n"
        when "strongest"
        p user.strongest
        when "smartest"
        p user.smartest
        when "fastest"
        p user.fastest
        when "publisher"
            user.favorite_publishers
        when "menu"
            options
        when "exit"
            exit_app
        end

    end

    
end
 
 runner
