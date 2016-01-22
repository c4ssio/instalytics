class MediaRepository
  include Lotus::Repository

  def self.find_or_replace(media)
    old_media = fetch("select id from medias where media_id='#{media.media_id}'").first
    if old_media
      media.id = old_media[:id]
    end
    persist(media)
  end
end
