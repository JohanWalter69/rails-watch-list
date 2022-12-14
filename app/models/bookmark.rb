class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  has_one_attached :photo

  validates :movie, :list, presence: true
  validates :comment, length: { minimum: 6 }
  validates :movie_id, presence: true, uniqueness: { scope: :list }
  validates :list_id, presence: true, uniqueness: { scope: :movie }
end
