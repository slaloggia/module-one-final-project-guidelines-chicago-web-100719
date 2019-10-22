class Character < ActiveRecord::Base
    belongs_to :publisher
    has_many :users, through: :user_characters

end