json.array!(@articles) do |article|
  json.extract! article, :id, :type, :resource_type, :resource_id, :title, :content, :icon, :published, :position
  json.url article_url(article, format: :json)
end
