#############################################################
#
# Timelines Functions
#
#############################################################

function get_mentions_timeline(count::Int; options = Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/statuses/mentions_timeline.json", setindex!(options, "$count", "count"))

end

function get_user_timeline(screen_name::String; options = Dict())
    
    endpoint = "https://api.twitter.com/1.1/statuses/user_timeline.json"
    
    r = get_oauth("https://api.twitter.com/1.1/statuses/user_timeline.json", setindex!(options, "$screen_name", "screen_name"))

end

function get_home_timeline(count::Int; options = Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/statuses/home_timeline.json", setindex!(options, "$count", "count"))

end

function get_retweets_of_me(count::Int; options = Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/statuses/retweets_of_me.json", setindex!(options, "$count", "count"))

end