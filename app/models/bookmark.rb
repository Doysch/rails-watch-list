class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, length: { minimum: 6, message: 'A comment must be more than 6 characters' }
  validates :movie_id, uniqueness: { scope: :list_id, message: "is already in the list" }
end
