#############################################################
#
# Lists Functions
#
#############################################################

function get_lists(; options = Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/lists/list.json", options)

end

function get_lists_statuses(; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/lists/statuses.json", options)

end

function post_lists_members_destroy()
	error("Twitter API not fully implemented")
end

function get_lists_memberships(; options = Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/lists/memberships.json", options)

end

function get_lists_subscribers(; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/lists/subscribers.json", options)

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

end

function get_lists_subscriptions(; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/lists/subscriptions.json", options)

end

function post_lists_members_destroyall()
	error("Twitter API not fully implemented")
end

function get_lists_ownerships(; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/lists/ownerships.json", options)

end