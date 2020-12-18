class Crop < ActiveRecord::Base
    validates :name, presence: true
    validates :quantity, presence: true
    validates :quantity, length: {minimum: 1}
    validates :year, presence: true
    validates :season, presence: true
    
    belongs_to :user
end