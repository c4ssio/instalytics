Lotus::Model.migration do
  change do
    create_table :medias do
      primary_key :id
      column :media_id, String, unique: true 
      column :user_id, String, null: false
      column :hashtag_ids, String, size: 1024
      column :comment_count, Integer
      column :like_count, Integer
      column :format, String
      column :caption, String, size: 2048
      column :created_at, Time
      column :updated_at, Time
    end
  end
end
