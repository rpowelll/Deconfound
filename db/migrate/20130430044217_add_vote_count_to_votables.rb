class AddVoteCountToVotables < ActiveRecord::Migration
  def change
    add_column :questions, :votes_count, :integer
    add_column :answers, :votes_count, :integer
  end
end
