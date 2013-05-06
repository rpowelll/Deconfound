class AddDeadToVotables < ActiveRecord::Migration
  def change
  	add_column :questions, :dead, :boolean, default: false
  	add_column :answers, :dead, :boolean, default: false
  end
end
