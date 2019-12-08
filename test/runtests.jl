using Twitter, Test

twitterauth(ENV["CONSUMER_KEY"], ENV["CONSUMER_SECRET"], ENV["ACCESS_TOKEN"], ENV["ACCESS_TOKEN_SECRET"])

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
duke_tweets = get_search_tweets(q = "#Duke")
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

# testing the cursor functions

# create a cursor for friend ids
mycursor = Cursorable(Dict(), "stefanjwojcik", -1, get_friends_ids)

test_friend_ids = fill(0, 0)

for element in mycursor
    if "ids" ∈ keys(element.body)
        append!(test_friend_ids, element.body["ids"])
    end
end

@test length(test_friend_ids) > 200 > 300

# create a test cursor for followers ids
mycursor = Cursorable(Dict(), "stefanjwojcik", -1, get_followers_ids)

test_follower_ids = fill(0, 0)

for element in mycursor
    if "ids" ∈ keys(element.body)
        append!(test_follower_ids, element.body["ids"])
    end
end

@test length(test_follower_ids) > 500 > 600
