json.array!(@links) do |link|
  json.extract! link, :id, :user_id, :long, :short
  json.url link_url(link, format: :json)
end
