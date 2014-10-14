json.array!(@groups) do |group|
  json.extract! group, :id, :title, :description, :permalink, :icon, :published, :position
  json.url group_url(group, format: :json)
end
