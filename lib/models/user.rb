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

    def favorite_characters
        favorite_names = all_favorites.map {|favorite| Character.find_by(id: favorite.character_id).name}
        puts "Your favorite characters are:"
        favorite_names.each {|name| puts name}
    end
end