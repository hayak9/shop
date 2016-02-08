json.array!(@brands) do |brand|
  json.extract! brand, :id, :name, :image
  json.url brand_url(brand, format: :json)
end
