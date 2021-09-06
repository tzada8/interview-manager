class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :prompt, limit: 4096, null: false 
      t.string :answer, limit: 4096

      t.timestamps
    end
  end
end
