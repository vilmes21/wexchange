json.extract! post, :id, :title, :description, :category, :value, :user_id, :location, :exchanged_post_id, :duration, :time, :created_at, :updated_at
json.url post_url(post, format: :json)