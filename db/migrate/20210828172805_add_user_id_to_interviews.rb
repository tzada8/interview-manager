class AddUserIdToInterviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :interviews, :user, null: false, index: true
    add_foreign_key :interviews, :users
  end
end
