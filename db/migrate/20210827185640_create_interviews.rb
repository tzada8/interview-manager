class CreateInterviews < ActiveRecord::Migration[6.1]
  def change
    create_table :interviews do |t|
      t.string  :company,     null: false, limit: 100
      t.string  :position,    null: false, limit: 100
      t.string  :industry,    null: false, limit: 100
      t.date    :date,        null: false
      t.integer :duration,    null: false
      t.string  :interviewer, null: false, limit: 100

      t.timestamps
    end
  end
end
