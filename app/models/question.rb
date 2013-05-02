class Question < ActiveRecord::Base
	include Votable

	has_many :answers
	belongs_to :user
end
