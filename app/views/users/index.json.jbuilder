json.array!(@users) do |user|
  json.extract! user, :id, :firstname, :lastname, :email, :address, :password_digest
  json.url user_url(user, format: :json)
end
