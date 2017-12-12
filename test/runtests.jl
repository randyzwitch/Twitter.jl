using Twitter, Base.Test

twitterauth(CONSUMER_KEY, CONSUMER_SECRET, ACCESS_TOKEN, ACCESS_TOKEN_SECRET)

mentions_timeline_default = get_mentions_timeline()
@test 0 <= length(mentions_timeline_default) <= 20
