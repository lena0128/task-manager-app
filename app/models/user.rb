class User < ApplicationRecord
    has_many :tasks
    has_many :buckets, through: :tasks
    has_secure_password

    validates_presence_of :username, :email
end
