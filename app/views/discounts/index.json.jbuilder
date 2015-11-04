json.array!(@discounts) do |discount|
  json.extract! discount, :id, :company_id, :user_id, :discount_percent, :restrictions
  json.url discount_url(discount, format: :json)
end
