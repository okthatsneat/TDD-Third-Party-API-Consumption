json.array!(@user_requests) do |user_request|
  json.extract! user_request, :uid, :pub0, :page
  json.url user_request_url(user_request, format: :json)
end
