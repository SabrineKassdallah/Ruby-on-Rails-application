class User < ApplicationRecord
    has_many :products
    has_secure_password
    
    # add validation for attributes
    validates :username, presence: true, uniqueness: true
    validates :email,    presence: true, uniqueness: true
    validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

end
