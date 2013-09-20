json.array!(@offers) do |offer|
  json.extract! offer, :uid, :pub0, :page
  json.url offer_url(offer, format: :json)
end
