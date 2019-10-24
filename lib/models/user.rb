
class User < ActiveRecord::Base
    has_many :characters, through: :user_characters
    has_many :publishers, through: :user_characters

    def add_character_to_favorites(name)
        if Character.exists?(name: name)
            character = Character.find_by_name(name)
            UserCharacter.find_or_create_by(user_id: self.id, character_id: character.id)
            p "#{name} has been saved to your favorites!"
        else
            p "I'm sorry, this character is not in our database"
        end
    end

    def find_favorite(character)
        UserCharacter.find_by(user_id: self.id, character_id: Character.find_by_name(character).id)
    end

    def update_character_rating(character, new_rating)
        if find_favorite(character)
        favorite = find_favorite(character)
        favorite.update_attribute(:rating, new_rating)
        else
            puts "Sorry, I could not find this character in your favorites."
        end
    end

    def all_favorites
        UserCharacter.where("user_id = ?", self.id)
    end

    def favorite_characters_names
        favorite_names = all_favorites.map {|favorite| Character.find_by(id: favorite.character_id).name}
        puts "\nYour favorite characters are:"
        favorite_names.each {|name| puts "- #{name}"}
    end

    def favorite_publishers
        publisher_id = all_favorites.map {|f| Character.find_by(id: f.character_id).publisher_id}
        publishers = publisher_id.map {|id| Publisher.find_by(id: id)}
        sorted = publishers.inject(Hash.new(0)) {|total, p| total[p] += 1; total}
        p sorted.max_by{|k,v| v}[0][:name]
        
    end
    
    def delete_from_favorites(character)
        find_favorite(character).delete
        puts "#{character} has been removed from your team and exiled to the Phantom Zone!!!!!"
    end
     
    def favorite_characters
        all_favorites.map {|favorite| Character.find_by(id: favorite.character_id)}
    end

    def strongest
        strong = favorite_characters.max_by {|c| c["strength"]}
        puts "\n"
        return "#{strong.name} has a strength of #{strong.strength}!"
    end

    def smartest
        smart = favorite_characters.max_by {|c| c["intelligence"]}
        puts "\n"
        return "#{smart.name} has an intelligence of #{smart.intelligence}!"
    end

    def fastest
        fast = favorite_characters.max_by {|c| c["speed"]}
        puts "\n"
        return "#{fast.name} has a speed of #{fast.speed}!"
    end

    
end


 
