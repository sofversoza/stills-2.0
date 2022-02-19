class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comment, :user_id, :movie_id
  belongs_to :user
  belongs_to :movie
end
