json.array!(@articles) do |article|
  json.extract! article, :id, :title, :description, :published_by, :published_at, :published
  json.url article_url(article, format: :json)
end
