class AddUserToQuestion < ActiveRecord::Migration
  def up
    add_reference :questions, :user, index: true
    Question.update_all(user_id: 1)
  end

  def down
	remove_reference :questions, :user
  end
end
