class User < ActiveRecord::Base
    has_many :characters, through: :user_characters
    has_many :publishers, through: :user_characters
end