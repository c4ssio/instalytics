require 'spec_helper'

describe Hashtag do
  # place your tests here
  it 'can be initialized with attributes' do
    hashtag = Hashtag.new(tag: 'test_tag', refresh_rate_hours: 1)
    hashtag.tag.must_equal 'test_tag'
  end

  it "can't be saved without a tag" do
    hashtag = Hashtag.new
    error = ->{HashtagRepository.create(hashtag)}
    error = error.must_raise(Lotus::Model::Error)
    error.message.must_equal "SQLite3::ConstraintException: NOT NULL constraint failed: hashtags.tag"
  end
end
