#############################################################
#
# Lists Functions
#
#############################################################

function get_lists(screen_name::String; options = Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/lists/list.json", setindex!(options, "$screen_name", "screen_name"))

    return parse_response(r, "LISTS")

end

function get_lists_statuses()
	error("Twitter API not fully implemented")
end

function post_lists_members_destroy()
	error("Twitter API not fully implemented")
end

function get_lists_memberships(screen_name::String; options = Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/lists/memberships.json", setindex!(options, "$screen_name", "screen_name"))

    return parse_response(r, "LISTS")

end

function get_lists_subscribers()
	error("Twitter API not fully implemented")
end

function post_lists_subscribers_create()
	error("Twitter API not fully implemented")
end

function get_lists_subscribers_show()
	error("Twitter API not fully implemented")
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

function get_lists_members()
	error("Twitter API not fully implemented")
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

function get_lists_show()
	error("Twitter API not fully implemented")
end

function get_lists_subscriptions()
	error("Twitter API not fully implemented")
end

function post_lists_members_destroyall()
	error("Twitter API not fully implemented")
end

function get_lists_ownerships()
	error("Twitter API not fully implemented")
end