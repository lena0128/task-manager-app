class User < ApplicationRecord
    has_many :tasks
    has_many :buckets, through: :tasks
    has_secure_password
end
