json.array!(@user_x_heros) do |user_x_hero|
  json.extract! user_x_hero, :id, :login, :heroid
  json.url user_x_hero_url(user_x_hero, format: :json)
end
