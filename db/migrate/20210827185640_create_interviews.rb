class CreateInterviews < ActiveRecord::Migration[6.1]
  def change
    create_table :interviews do |t|
      t.string :position, limit: 100, null:false
      t.string :company, limit: 100, null:false
      t.date :date, null:false
      t.integer :duration, null:false
      t.string :interviewer, limit: 100, null:false
      t.string :industry, limit: 100, null:false

      t.timestamps
    end
  end
end
