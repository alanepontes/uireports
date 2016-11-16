json.array!(@profile_projects) do |profile_project|
  json.extract! profile_project, :id, :name, :description, :status, :heuristic_id
  json.url profile_project_url(profile_project, format: :json)
end
