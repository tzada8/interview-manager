class CreateGenerics < ActiveRecord::Migration[6.1]
  def change
    create_table :generics do |t|
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
