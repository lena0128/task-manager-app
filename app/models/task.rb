class Task < ApplicationRecord
    belongs_to :bucket
    belongs_to :user

    validates_presence_of :name, :description, :status
end