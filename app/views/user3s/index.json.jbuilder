json.array!(@user3s) do |user3|
  json.extract! user3, :id, :name, :email
  json.url user3_url(user3, format: :json)
end
