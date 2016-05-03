json.array!(@items) do |item|
  json.extract! item, :id, :item_name, :amount, :price, :comment, :user_id, :order_id
  json.url item_url(item, format: :json)
end
