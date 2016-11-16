json.array!(@profile_answers) do |profile_answer|
  json.extract! profile_answer, :id, :problem, :level, :comment, :user_id, :question_id, :tela_id
  json.url profile_answer_url(profile_answer, format: :json)
end
