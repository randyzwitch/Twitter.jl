#############################################################
#
# Friends & Followers Functions
#
#############################################################

function get_friendships_no_retweets( ; options=Dict{String, String}())
	
	r = get_oauth("https://api.twitter.com/1.1/friendships/no_retweets/ids.json", options)

end

function get_friends_ids(; options=Dict{String, String}())
    
    r = get_oauth("https://api.twitter.com/1.1/friends/ids.json", options)

end

function get_followers_ids(; options=Dict{String, String}())
    
    r = get_oauth("https://api.twitter.com/1.1/followers/ids.json", options)

end

function get_friendships_lookup(; options=Dict{String, String}())
	
	r = get_oauth("https://api.twitter.com/1.1/friendships/lookup.json", options)

end

function get_friendships_incoming(; options=Dict{String, String}())
	
	r = get_oauth("https://api.twitter.com/1.1/friendships/incoming.json", options)

end

function get_friendships_outgoing(; options=Dict{String, String}())
	
	r = get_oauth("https://api.twitter.com/1.1/friendships/outgoing.json", options)

end

function post_friendships_create(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/friendships/create.json", options)

    #Return array of type USERS
    return to_USERS(r)

end

function post_friendships_destroy(; options=Dict{String, String}())
	
	r = post_oauth("https://api.twitter.com/1.1/friendships/destroy.json", options)

    #Return array of type USERS
    return to_USERS(r)

end

function post_friendships_update(; options=Dict{String, String}())
	
	r = post_oauth("https://api.twitter.com/1.1/friendships/destroy.json", options)

end

function get_friendships_show(; options=Dict{String, String}())
	
	r = get_oauth("https://api.twitter.com/1.1/friendships/show.json", options)

end

function get_friends_list(; options=Dict{String, String}())
    
    r = get_oauth("https://api.twitter.com/1.1/friends/list.json", options)

    #Return users array
    return to_USERS(r["users"])

end

function get_followers_list(; options=Dict{String, String}())
    
    r = get_oauth("https://api.twitter.com/1.1/followers/list.json", options)

    #Return users array
    return to_USERS(r["users"])

end