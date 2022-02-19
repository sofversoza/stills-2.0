class Movie < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    has_many :favorites
    has_many :users, through: :favorites
    has_many :genre
    
    before_create :slugify  
    def slugify
        self.slug = title.parameterize
    end
    
    def avg_rating
        return 0 unless reviews.count.positive?
        reviews.average(:rating).round(2).to_f
    end
end
