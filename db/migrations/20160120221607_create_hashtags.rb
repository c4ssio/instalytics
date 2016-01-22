Lotus::Model.migration do
  change do
    create_table :hashtags do
      primary_key :id
      column :hashtag_id, String, unique: true
      column :max_media_count, Integer
      column :stats, String, size: 1024
      column :created_at, Time
      column :updated_at, Time
    end
  end
end
