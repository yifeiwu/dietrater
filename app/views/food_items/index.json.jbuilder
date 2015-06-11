json.array!(@food_items) do |food_item|
  json.extract! food_item, :id, :name, :serve_size, :nut_type, :nut_size
  json.url food_item_url(food_item, format: :json)
end
