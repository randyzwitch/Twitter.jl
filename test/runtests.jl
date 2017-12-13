using Twitter, Base.Test

twitterauth(ENV["CONSUMER_KEY"], ENV["CONSUMER_SECRET"], ENV["ACCESS_TOKEN"], ENV["ACCESS_TOKEN_SECRET"])

#get_mentions_timeline/Tweets/DataFrame
mentions_timeline_default = get_mentions_timeline()
@test 0 <= length(mentions_timeline_default) <= 20

tw = Tweets(mentions_timeline_default[1])
tw_list = Tweets(mentions_timeline_default)
tw_df = DataFrame(tw_list)

@test typeof(tw) == Tweets
@test typeof(tw_list) == Vector{Tweets}
@test size(tw_df)[2] == 30
