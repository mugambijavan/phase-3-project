class Todo < ActiveRecord::Base
    # include TodoList
    belongs_to :user
    belongs_to :category

    has_one :status, dependent: :destroy

    validates :title, presence: true, on: [:create, :update]
    validates :content, presence: true, on: [:create, :update]

    scope :today, -> { where("DATE(created_at) = ?", Date.today) }
    scope :week, -> { where(created_at: 1.week.ago..Date.today) }
    scope :month, -> { where(created_at: 1.month.ago..Date.today) }

end
