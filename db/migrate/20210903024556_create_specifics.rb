class CreateSpecifics < ActiveRecord::Migration[6.1]
  def change
    create_table :specifics do |t|
      t.references :interview, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
