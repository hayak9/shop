json.array!(@products) do |product|
  json.extract! product, :id, :name, :product_type, :price, :image, :brand_id
  json.url product_url(product, format: :json)
end
