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

# create a cursor for follower ids
follow_cursor_test = get_followers_ids(screen_name = "twitter", count = 10_000)
@test length(follow_cursor_test["ids"]) == 10_000

# create a cursor for friend ids - use barackobama because he follows a lot!
friend_cursor_test = get_friends_ids(screen_name = "BarackObama", count = 10_000)
@test length(friend_cursor_test["ids"]) == 10_000

# create a test for timelines
user_t = get_user_timeline(screen_name = "twitter", count = 1_000)
@test length(user_t) == 1_000

# create a test for home timelines
home_t = get_home_timeline(count = 700)
@test length(home_t) > 1

# get tweet max id
tweets = get_user_timeline(screen_name = "randyzwitch", count = 400)
# should return 399
tweets_since = get_user_timeline(screen_name = "randyzwitch", count = 400, since_id = 1209175355363336195)

# cut this
minid = minimum([x.id for x in tweets])

# the function i want to work:
#Juno.@enter get_user_timeline(screen_name = "randyzwitch", since_id = minid, count = 300) # returns only 199

function parse_options(;kwargs...)
    options = Dict{String, Any}()
    for arg in kwargs
        options[string(arg[1])] = arg[2]
    end
    options
end


TWITTERCRED = twitterauth(ENV["CONSUMER_KEY"], ENV["CONSUMER_SECRET"], ENV["ACCESS_TOKEN"], ENV["ACCESS_TOKEN_SECRET"])

options = parse_options(screen_name = "randyzwitch", since_id = 1209175355363336195, count = 400)
api_options = copy(options)
cur_count = 0
endp = "statuses/user_timeline.json"
data_holder = copy(newdata) # save existing ids
r = get_oauth("https://api.twitter.com/1.1/$endp", options)
# parse and put into proper type form
newdata = [Tweets(x) for x in JSON.parse(String(r.body))]
# tree of options for max_id or since id
haskey(api_options, "max_id") | haskey(api_options, "since_id")
cur_count += length(newdata)
cursorable = cur_count < api_options["count"]
api_options["max_id"] = minimum([x.id for x in newdata])-1  # get min id
println("max_id = "*string(api_options["max_id"]))
newdata = vcat(data_holder, newdata)
cursorable, newdata, api_options, endp, cur_count

Juno.@enter cursor(cursorable, newdata, options, endp, cur_count)
