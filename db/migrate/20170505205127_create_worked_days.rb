class CreateWorkedDays < ActiveRecord::Migration[5.1]
  def change
    create_table :worked_days do |t|
      t.belongs_to :job, foreign_key: true
      t.date :date
      t.integer :hours

      t.timestamps
    end
  end
end
