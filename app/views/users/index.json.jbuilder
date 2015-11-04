json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :password, :city
  json.url user_url(user, format: :json)
end
