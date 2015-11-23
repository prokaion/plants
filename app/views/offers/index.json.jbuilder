json.array!(@offers) do |offer|
  json.extract! offer, :id, :price_cent, :desc
  json.url offer_url(offer, format: :json)
end
