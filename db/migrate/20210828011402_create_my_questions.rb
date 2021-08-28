class CreateMyQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :my_questions do |t|
      t.string :prompt, limit: 4096, null: false

      t.timestamps
    end
  end
end
