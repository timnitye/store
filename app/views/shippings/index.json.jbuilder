json.array!(@shippings) do |shipping|
  json.extract! shipping, :id, :address, :city, :state, :zip, :user_id, :cart_id
  json.url shipping_url(shipping, format: :json)
end
