class CreateUserCharacters < ActiveRecord::Migration[5.2]
    def change
        create_table :user_characters do |t|
            t.integer :user_id
            t.integer :character_id
            t.integer :rating
        end
    end
end