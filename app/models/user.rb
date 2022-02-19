class User < 
    has_secure_password
    has_many :reviews, dependent: :destroy
    has_many :movies, through: :reviews
    has_many :favorites, dependent: :destroy
    has_many :movies, through: :favorites
end
