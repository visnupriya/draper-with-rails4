json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :profile_picture, :twitter_name, :github_name
  json.url user_url(user, format: :json)
end
