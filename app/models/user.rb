class User < ApplicationRecord
    has_many :products
    has_secure_password
    
    # add validation for attributes
    validates :username, presence: true, uniqueness: true
    validates :email,    presence: true
    validates :password, presence: true

end
