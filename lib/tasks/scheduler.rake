desc "Recalculate scores for all the votables on the site"
task :calculate_scores => :environment do
  puts "Updating scores..."
  Question.recalculate_all_scores!
  Answer.recalculate_all_scores!
  puts "Done!"
end

desc "Recalculate scores for the most popular votables on the site"
task :calculate_popular_scores => :environment do
  puts "Updating scores..."
  Question.recalculate_popular_scores!
  Answer.recalculate_popular_scores!
  puts "Done!"
end