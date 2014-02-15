#############################################################
#
# Friends & Followers Functions
#
#############################################################

function get_friendships_no_retweets()
	error("Twitter API not fully implemented")
end

function get_friends_ids(screen_name::String; options = Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/friends/ids.json", setindex!(options, "$screen_name", "screen_name"))

    return parse_response(r, "THIS DOESN'T REALLY RETURN USERS OBJECT")

end

function get_followers_ids(screen_name::String; options = Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/followers/ids.json", setindex!(options, "$screen_name", "screen_name"))

    return parse_response(r, "THIS DOESN'T REALLY RETURN USERS OBJECT")

end

function get_friendships_lookup()
	error("Twitter API not fully implemented")
end

function get_friendships_incoming()
	error("Twitter API not fully implemented")
end

function get_friendships_outgoing()
	error("Twitter API not fully implemented")
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

function get_friendships_show()
	error("Twitter API not fully implemented")
end

function get_friends_list(screen_name::String; options = Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/friends/list.json", setindex!(options, "$screen_name", "screen_name"))

    return parse_response(r, "USERS")

end

function get_followers_list(screen_name::String; options = Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/followers/list.json", setindex!(options, "$screen_name", "screen_name"))

    return parse_response(r, "USERS")

end