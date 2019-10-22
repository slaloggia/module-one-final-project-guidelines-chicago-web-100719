class CreateCharacters < ActiveRecord::Migration[5.2]
    def change
        create_table :characters do |t|
            t.string :name
            t.string :secret_identity
            t.integer :strength
            t.integer :speed
            t.integer :intelligence
            t.string :alignment
            t.integer :publisher_id
            
        end
    end
end