json.array!(@visits) do |visit|
  json.extract! visit, :id, :link_id, :ip, :browser, :browser_version, :os
  json.url visit_url(visit, format: :json)
end
