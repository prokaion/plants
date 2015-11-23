json.array!(@admin_sub_paths) do |admin_sub_path|
  json.extract! admin_sub_path, :id, :part, :path_id, :terminator, :id_ref
  json.url admin_sub_path_url(admin_sub_path, format: :json)
end
