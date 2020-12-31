class User < ActiveRecord::Base
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :email, presence: true
    validates :email, uniqueness: true
    
    has_secure_password

    has_many :crops
end
