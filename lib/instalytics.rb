require 'lotus/model'
require 'lotus/mailer'
Dir["#{ __dir__ }/instalytics/**/*.rb"].each { |file| require_relative file }

Lotus::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/instalytics_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/instalytics_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/instalytics_development'
  #    adapter type: :sql, uri: 'mysql://localhost/instalytics_development'
  #
  adapter type: :sql, uri: ENV['INSTALYTICS_DATABASE_URL']

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:
  #
  # mapping "#{__dir__}/config/mapping"
  #
  # Alternatively, you can use a block syntax like the following:
  #
  mapping do
    collection :hashtags do
      entity     Hashtag
      repository HashtagRepository
      attribute :id,  Integer
      attribute :hashtag_id,  String
      attribute :stats, String
      attribute :max_media_count, Integer
      attribute :created_at, Time
      attribute :updated_at, Time
    end
    
    collection :medias do
      entity     Media
      repository MediaRepository
      attribute :id, Integer
      attribute :media_id, String
      attribute :user_id, String
      attribute :hashtag_ids, String
      attribute :comment_count, Integer
      attribute :like_count, Integer
      attribute :format, String
      attribute :caption, String
      attribute :created_at, Time
      attribute :updated_at, Time
    end
  end
end.load!

Lotus::Mailer.configure do
  root "#{ __dir__ }/instalytics/mailers"

  # See http://lotusrb.org/guides/mailers/delivery
  delivery do
    development :test
    test        :test
    # production :stmp, address: ENV['SMTP_PORT'], port: 1025
  end
end.load!
