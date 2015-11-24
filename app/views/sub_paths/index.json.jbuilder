json.array!(@sub_paths) do |sub_path|
  json.extract! sub_path, :id, :part, :path_id, :terminator, :id_ref
  json.url sub_path_url(sub_path, format: :json)
end
