class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :password, :email, :password_digest
  has_many :favorites
  has_many :reviews
  has_many :movies
end
