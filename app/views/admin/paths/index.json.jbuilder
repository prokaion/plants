json.array!(@admin_paths) do |admin_path|
  json.extract! admin_path, :id, :name, :shop_id
  json.url admin_path_url(admin_path, format: :json)
end
