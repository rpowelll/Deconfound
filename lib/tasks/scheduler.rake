desc "Recalculate scores for all the votables on the site"
task :calculate_scores => :environment do
  puts "Updating scores..."
  Question.recalculate_all_scores!
  Answer.recalculate_all_scores!
  puts "Done!"
end