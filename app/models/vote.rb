class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true, counter_cache: true

  validates :user_id, uniqueness: { scope: :votable_id }
end
