json.array!(@statuses) do |status|
  json.extract! status, :id, :title, :body
  json.url status_url(status, format: :json)
end
