class Media
  include Lotus::Entity
  attributes :id, :media_id, :user_id, :comment_count, :like_count, :hashtag_ids, :format, :caption, :created_at, :updated_at

  def Media.sample_from_hashtag(hashtag_id)

    client = Instagram.client(access_token: ENV['INSTAGRAM_ACCESS_TOKEN'])

    recent_medias = client.tag_recent_media( hashtag_id )

    recent_medias.each do |recent_media|

      media = Media.new

      media.media_id      = recent_media['id']
      media.user_id       = recent_media['user']['id']
      media.comment_count = recent_media['comments']['count']
      media.like_count    = recent_media['likes']['count']
      media.hashtag_ids   = recent_media['tags'].join("|||")
      media.format        = recent_media['type']
      media.caption       = recent_media['caption']['text']

      MediaRepository.find_or_replace(media)
    end

    return true
  end
end
