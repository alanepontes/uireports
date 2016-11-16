json.array!(@admin_heuristics) do |admin_heuristic|
  json.extract! admin_heuristic, :id, :name, :description, :device_is
  json.url admin_heuristic_url(admin_heuristic, format: :json)
end
