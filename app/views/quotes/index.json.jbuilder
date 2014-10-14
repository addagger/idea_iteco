json.array!(@quotes) do |quote|
  json.extract! quote, :id, :who, :said, :when, :where
  json.url quote_url(quote, format: :json)
end
