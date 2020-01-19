using Twitter, Test
using JSON, OAuth

twitterauth(ENV["CONSUMER_KEY"], ENV["CONSUMER_SECRET"], ENV["ACCESS_TOKEN"], ENV["ACCESS_TOKEN_SECRET"])

TWITTERCRED = twitterauth(ENV["CONSUMER_KEY"], ENV["CONSUMER_SECRET"], ENV["ACCESS_TOKEN"], ENV["ACCESS_TOKEN_SECRET"])


#get_mentions_timeline
mentions_timeline_default = get_mentions_timeline()
tw = mentions_timeline_default[1]
tw_df = DataFrame(mentions_timeline_default)
@test 0 <= length(mentions_timeline_default) <= 20
@test typeof(mentions_timeline_default) == Vector{Tweets}
@test typeof(tw) == Tweets
@test size(tw_df)[2] == 30

#get_user_timeline
user_timeline_default = get_user_timeline(screen_name = "randyzwitch")
@test typeof(user_timeline_default) == Vector{Tweets}

#get_home_timeline
home_timeline_default = get_home_timeline()
@test typeof(home_timeline_default) == Vector{Tweets}

#get_single_tweet_id
get_tweet_by_id = get_single_tweet_id(id = "434685122671939584")
@test typeof(get_tweet_by_id) == Tweets

#get_search_tweets
duke_tweets = get_search_tweets(q = "#Duke", count = 300)
@test typeof(duke_tweets) <: Dict

#test sending/deleting direct messages
#commenting out because Twitter API changed. Come back to fix
# send_dm = post_direct_messages_send(text = "Testing from Julia, this might disappear later $(time())", screen_name = "randyzwitch")
# get_single_dm = get_direct_messages_show(id = send_dm.id)
# destroy = post_direct_messages_destroy(id = send_dm.id)
# @test typeof(send_dm) == Tweets
# @test typeof(get_single_dm) == Tweets
# @test typeof(destroy) == Tweets

#creating/destroying friendships
add_friend = post_friendships_create(screen_name = "kyrieirving")
unfollow = post_friendships_destroy(screen_name = "kyrieirving")
unfollow_df = DataFrame(unfollow)
@test typeof(add_friend) == Users
@test typeof(unfollow) == Users
@test size(unfollow_df)[2] == 40

# create a cursor for follower ids
follow_cursor_test = get_followers_ids(screen_name = "twitter", count = 10_000)
@test length(follow_cursor_test["ids"]) == 10_000

# create a cursor for friend ids - use barackobama because he follows a lot of accounts!
friend_cursor_test = get_friends_ids(screen_name = "BarackObama", count = 10_000)
@test length(friend_cursor_test["ids"]) == 10_000

# create a test for home timelines
home_t = get_home_timeline(count = 2)
@test length(home_t) > 1

# TEST of cursoring functionality on user timelines
tweets = get_user_timeline(screen_name = "stefanjwojcik", count = 400)
@test length(user_t) == 400
# get the minimum ID of the tweets returned (the earliest)
minid = minimum(x.id for x in tweets)
# now iterate until you hit that tweet: should return 399
tweets_since = get_user_timeline(screen_name = "stefanjwojcik", count = 400, since_id = minid, include_rts=1)
@test length(tweets_since)==399

# testing get_mentions_timeline
mentions = get_mentions_timeline(screen_name = "stefanjwojcik", count = 300)
@test length(mentions) >= 300
@test Tweets<:typeof(tweets[1])

# testing retweets_of_me
my_rts = get_retweets_of_me(count = 300)
@test Tweets<:typeof(my_rts[1])
