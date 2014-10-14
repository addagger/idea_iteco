json.array!(@categories) do |category|
  json.extract! category, :id, :title, :description, :projects_count
  json.url category_url(category, format: :json)
end
