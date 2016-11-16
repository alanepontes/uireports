class Profile::Evaluation < ActiveRecord::Base
	belongs_to :project
  belongs_to :user, :class_name => 'User'

  has_many :feedbacks

  validates_uniqueness_of :user_id, scope: :project_id
end
