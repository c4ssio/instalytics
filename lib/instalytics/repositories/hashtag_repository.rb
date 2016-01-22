class HashtagRepository
  include Lotus::Repository
  def self.get_stale
    formatted_time = (Time.now - 60 * ENV['INSTAGRAM_HASHTAG_REFRESH_RATE_MINUTES'].to_i).utc.strftime("%Y-%m-%d %H:%M:%S")
    fetch("select * from hashtags where updated_at<'#{formatted_time}'")
  end
  
  def self.find_or_replace(hashtag)
    old_hashtag = fetch("select id from hashtags where hashtag_id='#{hashtag.hashtag_id}'").first
    if old_hashtag
      hashtag.id = old_hashtag.id
    end
    persist(hashtag)
  end
end
