json.array!(@projects) do |project|
  json.extract! project, :id, :group_id, :title, :description, :commiters_count, :comments_count
  json.url project_url(project, format: :json)
end
