class AddScoreToQuestions < ActiveRecord::Migration
  def up
    add_column :questions, :score, :float
    Question.recalculate_all_scores!
  end

  def down
    remove_column :questions, :score
  end
end
