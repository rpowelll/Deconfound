class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :username,  presence: true, 
                        uniqueness: true

  validates :email,     presence: true,
                        uniqueness: true,
                        format: { with: /[a-z]{2,3}\d{3}@uowmail\.edu\.au/, 
                                  message: "We're only accepting UOW students for now" }

  validates :password,  presence: true,
                        confirmation: true

  has_many :questions
  has_many :answers
  has_many :votes
end