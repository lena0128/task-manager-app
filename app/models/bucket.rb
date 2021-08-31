class Bucket < ApplicationRecord
    has_many :tasks
    has_many :users, through: :tasks

    validates_presence_of :name, :description, :status, :quantity
end