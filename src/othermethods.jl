function get_geo_id_place_id(place_id::String; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/geo/id/$(place_id).json", options)

    return r.status == 200 ? Places(JSON.parse(String(r.body))) : error("Twitter API returned $(r.status) status")

end

function get_user_suggestions_slug(slug::String; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/users/suggestions/$(slug).json", options)

    return r.status == 200 ? JSON.parse(String(r.body)) : error("Twitter API returned $(r.status) status")

end

function get_user_suggestions_slug_members(slug::String; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/users/suggestions/$(slug)/members.json", options)

    return r.status == 200 ? Users(JSON.parse(String(r.body))) : error("Twitter API returned $(r.status) status")

end

function get_retweets_id(id::String; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/statuses/retweets/$(id).json", options)

    return r.status == 200 ? Tweets(JSON.parse(String(r.body))) : error("Twitter API returned $(r.status) status")
end

function post_destroy_single_tweet_id(id::String; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/statuses/destroy/$(id).json", options)

    return r.status == 200 ? Tweets(JSON.parse(String(r.body))) : error("Twitter API returned $(r.status) status")

end

function post_status_retweet_id(id::String; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/statuses/retweet/$(id).json", options)

    return r.status == 200 ? Tweets(JSON.parse(String(r.body))) : error("Twitter API returned $(r.status) status")

end

function post_status_unretweet_id(id::String; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/statuses/unretweet/$(id).json", options)

    return r.status == 200 ? Tweets(JSON.parse(String(r.body))) : error("Twitter API returned $(r.status) status")

end
