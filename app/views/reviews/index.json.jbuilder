json.array!(@reviews) do |review|
  json.extract! review, :id, :comment, :stars, :product_id, :user_id
  json.url review_url(review, format: :json)
end
