module FeedbacksHelper
  def feedback_types_to_array
    FeedbackType.all.pluck(:id, :info)
  end
  def user_evaluations_to_array(user, current_user)
    user.evaluations
      .reject{ |evaluation| evaluation.project.user == current_user }
      .collect{|evaluation| [ evaluation.project.name, evaluation.id ] }
  end
end
