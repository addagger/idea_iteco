json.array!(@features) do |feature|
  json.extract! feature, :id, :project_id, :name, :description, :icon, :position
  json.url feature_url(feature, format: :json)
end
