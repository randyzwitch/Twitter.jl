using Twitter, Base.Test

twitterauth(ENV["CONSUMER_KEY"], ENV["CONSUMER_SECRET"], ENV["ACCESS_TOKEN"], ENV["ACCESS_TOKEN_SECRET"])

mentions_timeline_default = get_mentions_timeline()
@test 0 <= length(mentions_timeline_default) <= 20
