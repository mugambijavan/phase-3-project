
class User < ActiveRecord::Base
    include ActiveModel::Validations
    # include UserApi

    has_many :todos, dependent: :destroy
    has_many :categories, through: :todos
    # USERS -< TODOS >- CATEGORIES


    # validation Macros
    validates :name, presence: true, on: [:create, :update]
    validates :email, presence: true
    validates :email, uniqueness: { case_sensitive: false, message: "That email is already associated to another account. Please use another email." }
    validates :password, presence: true
    validates :password, length: { in: 5..20}

    # Validation CallBack
    after_validation :normalize_fields, on: [:create, :update]
    
    private
    def normalize_fields
        puts "before validation"
        self.name = name.to_s.strip.downcase.titleize
        self.email = email.to_s.strip.downcase
    end
end

