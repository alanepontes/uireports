class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :ratings, :dependent => :destroy
  has_many :projects, class_name: 'Profile::Project', :dependent => :destroy
  has_many :invites, class_name: 'Profile::Invite', :dependent => :destroy
  has_many :evaluations, class_name: 'Profile::Evaluation', :dependent => :destroy
  has_many :answers, class_name: 'Profile::Answer', :dependent => :destroy

	has_attached_file :avatar,
  :storage => :dropbox,
  :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
  :styles => { :icon => "35x35#", :thumb => "80x80#", :medium => "150x150#" }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable

  def convidado(u_id, p_id)
    Profile::Invite.exists?(:user_id => u_id, :project_id => p_id)
  end   
end
