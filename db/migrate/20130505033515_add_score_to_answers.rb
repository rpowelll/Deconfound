class AddScoreToAnswers < ActiveRecord::Migration
  def up
    add_column :answers, :score, :float
    Answer.recalculate_all_scores!
  end

  def down
    remove_column :answers, :score
  end
end
