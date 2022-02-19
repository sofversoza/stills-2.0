class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :director, :cinematographer, :slug, :duration, :release_year, :starring, :description, :awards, :image1, :image2, :image3
  has_many :reviews
  has_many :favorites
  has_many :genres
end
