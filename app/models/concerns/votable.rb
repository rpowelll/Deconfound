module Votable
	extend ActiveSupport::Concern

	included do
		has_many :votes, as: :votable

		before_save do
			self.calculate_score
		end
	end

	# Calculate the score for an individual votable
	def calculate_score
		time_elapsed = self.created_at ? (Time.now - self.created_at) / (60 * 60) : 0.001
		votes = self.votes_count || 1

		self.score = (votes / time_elapsed ** 1.8).real
		self.dead = true if self.score < 1
	end

	# Calculate the score for an individual votable and update its database
	# record with that score
	def calculate_score!
		self.calculate_score
		self.save
	end

	module ClassMethods
		# Recalculate the score of every single votable, this could be made
		# _a lot_ more efficient
		def recalculate_all_scores!
			self.where(dead: false).find_each do |votable|
				votable.calculate_score!
			end
		end

		# Recalculate only the scores of the top 50 questions and answers
		def recalculate_popular_scores!
			self.where(dead: false).order('score DESC').limit(50).each do |votable|
				votable.calculate_score!
			end
		end
	end
end