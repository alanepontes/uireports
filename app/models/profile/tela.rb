class Profile::Tela < ActiveRecord::Base
	belongs_to :project
	has_many :answers, :dependent => :destroy

	acts_as_list scope: :project

	validates_presence_of :tela

	has_attached_file :tela, 
	:storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
	:styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }, 
	:default_url => "/images/:style/missing.png"

  	validates_attachment_content_type :tela, :content_type => /\Aimage\/.*\Z/	
end