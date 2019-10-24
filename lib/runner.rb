def welcome 
    puts "\n\nWelcome to SuperWorld! Enter your name:"
    puts "\n"
    gets.chomp
end

def exit_app
    box = TTY::Box.frame(width: 82, height: 5, align: :center, style: {bg: :red, fg: :yellow, border: {bg: :red, fg: :yellow}}) do
        "\nUntil next time, True Believer...\nEXCELSIOR!!!"
    end
    print box
end
 
def set_user(name)
    User.find_or_create_by(name: name)
end
 
def options
    table
end

def find_character(name)
    if Character.find_by(name: name)
        character = Character.find_by(name: name)
        puts "________________________"
        puts "Name: #{character.name}"
        puts "Secret Identity: #{character.secret_identity}"
        puts "Publisher: #{Publisher.find(character[:publisher_id])[:name]}"
        puts "Alignment: #{character.alignment}"
        puts "- Stats -"
        puts "  Strength: #{character.strength}"
        puts "  Speed: #{character.speed}"
        puts "  Intelligence: #{character.intelligence}"
        puts "________________________"
    else
        puts "That character is not in the database"
    end
end


def table
    menu_box = TTY::Box.frame(width: 82, height: 19, border: :thick, title: {top_left: 'MENU'}, style: {bg: :blue, fg: :white, border: {bg: :blue, fg: :white}}) do
    table = TTY::Table.new ['OPTIONS','DESCRIPTION'], [['- find', 'Find a character in the database'], 
    ['- add', 'Add a character to your favorites'], ['- delete', 'Remove character from your favorites'], 
    ['- favorites', 'See your favorite characters'],['- rate', 'Add/Update character ratings'], 
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
    puts "\nEnter a character name:"
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
        find_character(name)
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
        puts "\nYou have rated #{name} #{rating}"
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
