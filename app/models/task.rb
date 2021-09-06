class Task < ApplicationRecord
    belongs_to :bucket
    belongs_to :user

    validates_presence_of :name, :description, :status

    scope :tasks_not_start, -> {where(status: "Not Start")}
    scope :tasks_in_progress, -> {where(status: "In Progress")}
    scope :tasks_completed, -> {where(status: "Completed")}

end