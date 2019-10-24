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

def welcome_game
    puts "Choose your SuperHero :"
end

def pick_character(name)
    if Character.find_by(name: name)
        Character.find_by(name: name)
    else
        puts "Sorry, I couldn't find this character in our database. Please make another choice."
        return nil
    end
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
    sh = nil
    user_input = nil
    until sh.class == Character
        user_input = gets.strip
        sh = pick_character(user_input)
    end
    opp = get_random_character
    puts "Your opponent is: #{opp[:name]}"
    battle(sh, opp)
    
end


