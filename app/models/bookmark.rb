class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, length: { minimum: 6, message: 'A comment must be more than 6 characters' }
  validates :movie, uniqueness: { scope: :list }
end
