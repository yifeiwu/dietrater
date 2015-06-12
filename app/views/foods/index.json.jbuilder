json.array!(@foods) do |food|
  json.extract! food, :id, :name, :serve_size
  json.url food_url(food, format: :json)
end
