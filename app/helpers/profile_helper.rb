module ProfileHelper
    def feedback_average(user)
      Feedback.where(evaluation_id: user.evaluations).group(:feedback_type_id)
        .average(:rate)
        .collect { |result| { info: FeedbackType.find(result.first).info, average: result.last } }
    end

    def feed_back_user(evaluation)
      evaluation.feedbacks.order('feedback_type_id asc').collect{|feedback| {info: feedback.feedback_type.info, rate: feedback.rate } }
    end
end
