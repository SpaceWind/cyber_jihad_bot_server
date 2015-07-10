json.array!(@h_descriptors) do |h_descriptor|
  json.extract! h_descriptor, :id, :hid, :hero_name, :mood, :map, :pack_max_size, :experience, :exp_to_next_lvl, :x_pos, :y_pos, :hclass, :hrace
  json.url h_descriptor_url(h_descriptor, format: :json)
end
