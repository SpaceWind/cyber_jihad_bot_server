json.array!(@active_keys) do |active_key|
  json.extract! active_key, :id, :apikey, :login, :last_updated, :heroid, :last_controlled, :rolled_heroid
  json.url active_key_url(active_key, format: :json)
end
