class User < ActiveRecord::Base
  has_many :languages
  accepts_nested_attributes_for :languages, reject_if: :all_blank, allow_destroy: true

  has_many :experiences
  accepts_nested_attributes_for :experiences, reject_if: :all_blank, allow_destroy: true

  has_many :knowledges
  accepts_nested_attributes_for :knowledges, reject_if: :all_blank, allow_destroy: true

  has_many :educations
  accepts_nested_attributes_for :educations, reject_if: :all_blank, allow_destroy: true

  has_many :professions
  accepts_nested_attributes_for :professions, reject_if: :all_blank, allow_destroy: true

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

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable

  def convidado(u_id, p_id)
    Profile::Invite.exists?(:user_id => u_id, :project_id => p_id)
  end

  def indicatory
    experiences.to_a.sum(&:value)
  end
end
