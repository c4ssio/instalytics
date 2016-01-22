class Hashtag
  include Lotus::Entity
  attributes :id, :hashtag_id, :stats, :max_media_count, :created_at, :updated_at

  # gets the most recent medias until max media count is fulfilled, then
  # deletes the ones that are too old and keeps refreshing them

  def refresh_stats

  end
end
