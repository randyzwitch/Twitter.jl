#############################################################
#
# Lists Functions
#
#############################################################

function get_lists(; options = Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/lists/list.json", options)

    return to_LISTS(r)

end

function get_lists_statuses(; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/lists/statuses.json", options)

	return to_TWEETS(r)

end

function post_lists_members_destroy()
	error("Twitter API not fully implemented")
end

function get_lists_memberships(; options = Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/lists/memberships.json", options)

    return to_LISTS(r["lists"])

end

function get_lists_subscribers(; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/lists/subscribers.json", options)

	return to_USERS(r["users"])

end

function post_lists_subscribers_create()
	error("Twitter API not fully implemented")
end

function get_lists_subscribers_show(; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/lists/subscribers/show.json", options)

end

function post_lists_subscribers_destroy()
	error("Twitter API not fully implemented")
end

function post_lists_members_createall()
	error("Twitter API not fully implemented")
end

function post_lists_members_show()
	error("Twitter API not fully implemented")
end

function get_lists_members(; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/lists/members.json", options)

	return to_USERS(r["users"])

end

function post_lists_members_create()
	error("Twitter API not fully implemented")
end

function post_lists_destroy()
	error("Twitter API not fully implemented")
end

function post_lists_update()
	error("Twitter API not fully implemented")
end

function post_lists_create()
	error("Twitter API not fully implemented")
end

function get_lists_show(; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/lists/show.json", options)

	return to_LISTS(r)

end

function get_lists_subscriptions(; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/lists/subscriptions.json", options)

	return to_LISTS(r["lists"])

end

function post_lists_members_destroyall()
	error("Twitter API not fully implemented")
end

function get_lists_ownerships(; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/lists/ownerships.json", options)

	return to_LISTS(r["lists"])

end