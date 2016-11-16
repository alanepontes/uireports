class Feedback < ActiveRecord::Base
  belongs_to :evaluation, class_name: 'Profile::Evaluation'
  belongs_to :feedback_type

  validates_presence_of :feedback_type_id, :evaluation_id, :rate
  validates :rate, length: 1..5
  validates_inclusion_of :feedback_type_id, in: :valid_feedback_types, message: "não está entre os tipos válidos"

  validates_uniqueness_of :feedback_type_id, scope: :evaluation_id

  private
  def valid_feedback_types
    FeedbackType.all.pluck(:id)
  end
end
