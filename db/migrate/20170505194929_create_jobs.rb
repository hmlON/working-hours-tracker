class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.integer :hours_per_week, default: 20
      t.integer :min_working_hours, default: 0
      t.integer :max_working_hours, default: 12
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
