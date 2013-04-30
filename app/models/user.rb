class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true

  has_many :questions
  has_many :answers
  has_many :votes
end