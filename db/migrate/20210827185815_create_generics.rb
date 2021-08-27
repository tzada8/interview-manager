class CreateGenerics < ActiveRecord::Migration[6.1]
  def change
    create_table :generics do |t|
      t.string :prompt, limit: 4096, null:false
      t.string :answer, limit: 4096, null:false

      t.timestamps
    end
  end
end
