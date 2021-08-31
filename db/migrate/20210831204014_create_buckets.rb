class CreateBuckets < ActiveRecord::Migration[6.1]
  def change
    create_table :buckets do |t|
      t.string :name
      t.string :description
      t.string :status
      t.integer :quantity
      t.timestamps
    end
  end
end
