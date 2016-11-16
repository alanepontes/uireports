class Admin::Heuristic < ActiveRecord::Base
  belongs_to :device
	has_many :questions, -> { order("position ASC") }
	has_many :projects, class_name: 'Profile::Project'

	validates_presence_of :name
end
