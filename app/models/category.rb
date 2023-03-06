class Category < ActiveRecord::Base
    has_many :todos, dependent: :destroy
    has_many :users, through: :todos

    validates :category, presence: { message: " %{attribute} can't be blank." }

end

# CATEGORIES -< TODOS >- USERS
