json.array!(@food_entries) do |food_entry|
  json.extract! food_entry, :id, :name, :serve_size
  json.url food_entry_url(food_entry, format: :json)
end
