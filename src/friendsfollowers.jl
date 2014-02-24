#############################################################
#
# Friends & Followers Functions
#
#############################################################

function get_friendships_no_retweets( ; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/friendships/no_retweets/ids.json", options)

end

function get_friends_ids(; options = Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/friends/ids.json", options)

end

function get_followers_ids(; options = Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/followers/ids.json", options)

end

function get_friendships_lookup( ; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/friendships/lookup.json", options)

end

function get_friendships_incoming( ; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/friendships/incoming.json", options)

end

function get_friendships_outgoing( ; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/friendships/outgoing.json", options)

end

function post_friendships_create()
	error("Twitter API not fully implemented")
end

function post_friendships_destroy()
	error("Twitter API not fully implemented")
end

function post_friendships_update()
	error("Twitter API not fully implemented")
end

function get_friendships_show( ; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/friendships/show.json", options)

end

function get_friends_list(; options = Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/friends/list.json", options)

    #Return users array
    return to_USERS(r["users"])

end

function get_followers_list(; options = Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/followers/list.json", options)

    #Return users array
    return to_USERS(r["users"])

end