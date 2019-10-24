require_relative '../config/environment'




def welcome 
    puts "\n\nWelcome to SuperWorld! Enter your name:"
    puts "\n"
    gets.chomp
end

def exit_app
    box = TTY::Box.frame(width: 45, height: 5, align: :center, style: {bg: :red, fg: :yellow, border: {bg: :red, fg: :yellow}}) do
        "Until next time, True Believer...\nEXCELSIOR!!!"
    end
    print box
end
 
def set_user(name)
    User.find_or_create_by(name: name)
end
 
def options
    table
end

def who_dat
puts "\n***** Welcome to 'Who Dat?' the SuperHuman identity game! *****\n\nI'll give you a secret identity, you tell me which character it belongs to!\n\n"
guess = nil
    until guess == "exit game"
    masks = Character.all.select {|c| c.secret_identity != "" && c.secret_identity != c.name}
    right_character = masks.sample
    puts "--- Who is #{right_character.secret_identity}? ---\n\n"
    guess = gets.strip

        if guess == right_character.name
            puts "\nWell done, friend! Asgard toasts to your wisdom!\n\n"
        else
            puts "\nSorry, puny human, the correct answer is #{right_character.name}\n\n" 
        end
    end 
end

def table
    menu_box = TTY::Box.frame(width: 82, height: 19, border: :thick, title: {top_left: 'MENU'}, style: {bg: :blue, fg: :white, border: {bg: :blue, fg: :white}}) do
    table = TTY::Table.new ['OPTIONS','DESCRIPTION'], [['- find', 'Find a character in the database'], 
    ['- add', 'Add a character to your favorites'], ['- delete', 'Remove character from your favorites'], 
    ['- rate', 'Add/Update character ratings'], ['- favorites', 'See your favorite characters'],
    ['- publisher', 'See your favorite publisher'], ['- strongest', 'See your strongest character'], 
    ['- fastest', 'See your fastest character'], ['- smartest', 'See your smartest character'], 
    ['- battle ', 'Make characters fight! Who will win?'],
    ['- whodat', 'Play the secret identity guessing game'],
    ['- menu', 'View this menu'], ['- exit', 'Exits the program']]

    table.render :ascii, alignment: [:center], width: 80, resize: true
    end
    print menu_box
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
    table
    until user_command == "exit"
        puts "\n***** What do you want to do??? *****\n\n"
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
        when "battle"
            game_runner
        when "menu"
            options
        when "exit"
            exit_app
        end
    end

  
    
end

########################################################

 
def welcome_game
    puts "Choose your SuperHero :"
end

def pick_character(name)
    Character.find_by(name: name)
end

def get_random_character
    get_id = Character.pluck(:id).sample
    Character.find(get_id)
end

def battle(sh, opp)
superhero_power = [sh["speed"]||0,sh["strength"]||0,sh["intelligence"]||0].sum
opponent_power = [opp["speed"]||0,opp["strength"]||0,opp["intelligence"]||0].sum
    if superhero_power > opponent_power
        puts "Congratulations !!!! You're the winner!!!!"
    else puts "You've lost!!! Next time choose wisely!"
    end
end



def game_runner
    welcome_game  
    user_input = gets.strip
    sh = pick_character(user_input)
    opp = get_random_character
    puts "Your opponent is: #{opp[:name]}"
    battle(sh, opp)
    
end

runner
