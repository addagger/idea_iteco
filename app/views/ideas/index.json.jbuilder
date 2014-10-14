json.array!(@ideas) do |idea|
  json.extract! idea, :id, :resource_type, :resource_id, :person_id, :title, :description, :votes_up, :votes_down
  json.url idea_url(idea, format: :json)
end
