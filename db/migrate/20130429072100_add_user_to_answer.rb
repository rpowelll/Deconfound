class AddUserToAnswer < ActiveRecord::Migration
  def up
    add_reference :answers, :user, index: true
    Answer.update_all(user_id: 1)
  end

  def down
	remove_reference :answers, :user
  end
end
