class Question < ActiveRecord::Base
	has_many :answers
	belongs_to :user
	has_many :votes, as: :votable
end
