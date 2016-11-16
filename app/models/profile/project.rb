class Profile::Project < ActiveRecord::Base
  	belongs_to :heuristic, class_name: 'Admin::Heuristic'
  	belongs_to :user
  	has_many :invites, :dependent => :destroy
  	has_many :telas, -> { order("position ASC") }, :dependent => :destroy
  	has_many :evaluations, :dependent => :destroy

  	include PublicActivity::Model
	tracked

  	validates_presence_of :name
  	validates_presence_of :heuristic_id 
end
