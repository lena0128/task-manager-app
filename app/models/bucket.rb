class Bucket < ApplicationRecord
    has_many :tasks
    has_many :users, through: :tasks

    validates_presence_of :name, :description, :status, :quantity

    scope :buckets_empty, -> {where(status: "Empty")}
    scope :buckets_pending, -> {where(status: "Pending")}
    scope :buckets_completed, -> {where(status: "Completed")}

    #accepts_nested_attributes_for :tasks

    def tasks_attributes=(tasks_attributes)
        tasks_attributes.values.each do |hash|
          if hash[:id]
            task = Task.find_by(id: hash[:id])
            task.update(hash)
          else
            task = Task.find_or_create_by(hash)
            self.tasks << task
          end
        end
    end


end