class Admin::Question < ActiveRecord::Base
  belongs_to :heuristic
  has_many :answers, class_name: 'Profile::Answer'
  acts_as_list scope: :heuristic

  validates_presence_of :name
end
