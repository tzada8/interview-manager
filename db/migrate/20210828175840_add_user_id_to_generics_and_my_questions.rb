class AddUserIdToGenericsAndMyQuestions < ActiveRecord::Migration[6.1]
  def change
    add_reference :generics, :user, null: false, index: true
    add_foreign_key :generics, :users

    add_reference :my_questions, :user, null: false, index: true
    add_foreign_key :my_questions, :users
  end
end
