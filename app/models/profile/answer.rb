class Profile::Answer < ActiveRecord::Base
	belongs_to :tela
    belongs_to :user, :class_name => 'User'
    belongs_to :question, :class_name => 'Admin::Question'

    validates_uniqueness_of :user_id, scope: [:question_id, :project_id]
end
