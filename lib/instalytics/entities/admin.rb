class Admin
  include Lotus::Entity

  def Admin.perform

    client = Instagram.client(access_token: ENV['INSTAGRAM_ACCESS_TOKEN'])

    calls_left = response.headers[:x_ratelimit_limit].to_i

    stale_hashtags = HashtagRepository.get_stale
    
    while calls_left > 50

      stale_hashtags.each do |stale_hashtag|

        Resque.enqueue Hashtag, 'refresh', stale_hashtag.id

        calls_left -= 1
      end
    end
  end
end
