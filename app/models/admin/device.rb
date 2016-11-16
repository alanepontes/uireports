class Admin::Device < ActiveRecord::Base
  	has_many :heuristic
	has_many :project

	has_attached_file :icon, 
	:storage => :dropbox,
	:dropbox_credentials => Rails.root.join("config/dropbox.yml"),	
	:styles => { :thumb => "24x24>" }
	
  	validates_attachment_content_type :icon, :content_type => /\Aimage\/.*\Z/

	validates_presence_of :name
end
