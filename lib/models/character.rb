class Character < ActiveRecord::Base
    belongs_to :publisher
    has_many :users, through: :user_characters

    
    def self.power
        self.all.map{|c| [c["name"],[c["speed"]||0,c["strength"]||0,c["intelligence"]||0].sum]}.to_h
    end
end

