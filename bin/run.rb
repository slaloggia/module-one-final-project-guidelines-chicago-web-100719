require_relative '../config/environment'




def welcome 
    puts "\n\nWelcome to SuperWorld! Enter your name:"
    puts "\n"
    gets.chomp
end

def exit_app
    puts "Until next time, True Believer...\n\nEXCELSIOR!!!\n\n"
end
 
def set_user(name)
    User.find_or_create_by(name: name)
end
 
def options
    print TTY::Box.frame "*****Menu*****", "\n\n-find : Find a character in the database", "-add : Add a character to your favorites", 
    "-delete : Remove character from your favorites", "-rate : Add/Update character ratings", "-favorites : See your favorite characters",
    "-publisher : Finds your favorite publisher", "-strongest : See your strongest character", "-fastest : See your fastest character",
    "-smartest : See your smartest character", "-whodat : Play our Secret Identity guessing game", "-menu : View this menu", "-exit : Exits the program" 

end

def who_dat
puts "\nWelcome to 'Who Dat?' the SuperHuman identity game! \n\nI'll give you a secret identity, you tell me which character it belongs to!\n\n"
guess = nil
    until guess == "exit game"
    masks = Character.all.select {|c| c.secret_identity != "" && c.secret_identity != c.name}
    right_character = masks.sample
    puts "Who is #{right_character.secret_identity}?\n\n"
    guess = gets.strip

        if guess == right_character.name
            puts "\nWell done, friend!\n\n"
        else
            puts "\nSorry, puny human, the correct answer is #{right_character.name}\n\n" 
        end
    end 
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
        puts "What do you want to do???\n\n"
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
        when "whodat"
            who_dat
        when "menu"
            options
        when "exit"
            exit_app
        end

    end

    
end
 
 runner
