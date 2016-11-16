class Rating < ActiveRecord::Base
  	belongs_to :user

  	include PublicActivity::Model
	tracked

	validates_uniqueness_of :user_id, scope: :evaluator_id
end
