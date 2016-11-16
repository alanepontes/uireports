class Profile::Evaluation < ActiveRecord::Base
	belongs_to :project
    belongs_to :user, :class_name => 'User'

    validates_uniqueness_of :user_id, scope: :project_id
end