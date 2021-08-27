class CreateJoinTableGenericsInterviews < ActiveRecord::Migration[6.1]
  def change
    create_join_table :generics, :interviews do |t|
      # t.index [:generic_id, :interview_id]
      t.index [:generic_id, :interview_id], unique: true
    end
    add_foreign_key :generics_interviews, :generics, column: :generic_id, primary_key: "id"
    add_foreign_key :generics_interviews, :interviews, column: :interview_id, primary_key: "id"
  end
end
