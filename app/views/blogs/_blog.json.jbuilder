json.extract! blog, :id, :title, :body, :created_at, :updated_at, :topic_id, :status, :user_id, :audio, :permalink
json.url blog_url(blog, format: :json)