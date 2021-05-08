class User < ApplicationRecord
    has_secure_password
    validates :name, uniqueness: { message: 'User already exists' }, presence: true, length: { minimum: 1 }
   # just added - presence: true, length: { minimum: 1 } - as can currently save blank name
end
