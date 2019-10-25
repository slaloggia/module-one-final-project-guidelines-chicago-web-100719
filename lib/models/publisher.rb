class Publisher < ActiveRecord::Base
has_many :characters
has_many :users, through: :characters

def all_characters
    Character.where(publisher_id: self.id)
end
end