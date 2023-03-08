class Recipe < ApplicationRecord
  belongs_to :author, class_name: "User"

  has_many :ingredients
  
  enum difficulty: {
    beginner: 0,
    intermediate: 1,
    advanced: 2,
    expert: 3
  }
  validates :difficulty, presence: true
  validates :name, presence: true

  scope :favorites, -> { where(favorite: true) }
end

