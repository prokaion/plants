json.array!(@products) do |product|
  json.extract! product, :id, :name, :growth_habit
  json.url product_url(product, format: :json)
end
