class Character < ActiveRecord::Base
    belongs_to :publisher
    has_many :users, through: :user_characters

    
    def power
        [self["speed"]||0,self["strength"]||0,self["intelligence"]||0].sum
    end

    def self.find_secret_idents(name)
        all.where(secret_identity: name)
    end
end

