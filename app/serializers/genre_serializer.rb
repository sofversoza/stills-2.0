class GenreSerializer < ActiveModel::Serializer
  attributes :id, :name, :movie_id
  belongs_to :movie
end
