class Profile::Invite < ActiveRecord::Base
	belongs_to :project
    belongs_to :user, :class_name => 'User'

    include PublicActivity::Model
	tracked

    validates_presence_of :email
    validates_uniqueness_of :email, scope: :project_id
end
