class User < ApplicationRecord
    has_many :projects, dependent: :destroy
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
end
