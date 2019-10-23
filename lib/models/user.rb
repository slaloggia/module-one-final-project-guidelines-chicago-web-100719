
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
        favorite = find_favorite(character)
        favorite.update_attribute(:rating, new_rating)
    end

    def all_favorites
        UserCharacter.where("user_id = ?", self.id)
    end

    def favorite_characters_names
        favorite_names = all_favorites.map {|favorite| Character.find_by(id: favorite.character_id).name}
        puts "Your favorite characters are:"
        favorite_names.each {|name| puts name}
    end

    # def favorite_publishers
    #     publisher_id = all_favorites.map {|f| Character.find_by(id: f.character_id).publisher_id}
    #     publishers = publisher_id.map {|id| Publisher.find_by(id: id)}
    #     sorted = publishers.inject(Hash.new(0)) {|total, p| total[p] += 1; total}
    #     sorted.keys[0]
    # end
    
    def delete_from_favorites(character)
        find_favorite(character).delete
        puts "#{character} has been removed from your favorites and exiled"
    end
     
    def favorite_characters
        all_favorites.map {|favorite| Character.find_by(id: favorite.character_id)}
    end

    def strongest
        favorite_characters.max_by {|c| c["strength"]}
    end

    def smartest
        favorite_characters.max_by {|c| c["intelligence"]}
    end

    def fastest
        favorite_characters.max_by {|c| c["speed"]}
    end

    

end


 
