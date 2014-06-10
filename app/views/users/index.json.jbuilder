json.array!(@users) do |user|
  json.extract! user, :id, :username, :regid
  json.url user_url(user, format: :json)
end
