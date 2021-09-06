class AddUserIdToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_reference :questions, :user, null: false, index: true
    add_foreign_key :questions, :users
  end
end
