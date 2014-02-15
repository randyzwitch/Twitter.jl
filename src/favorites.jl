#############################################################
#
# Favorites Functions
#
#############################################################

function get_favorites_list(screen_name::String; options = Dict())
    r = get_oauth("https://api.twitter.com/1.1/favorites/list.json", setindex!(options, "$count", "count"))

    return parse_response(r, "TWEETS")

end

function post_favorites_destroy()
	error("Twitter API not fully implemented")
end

function post_favorites_create()
	error("Twitter API not fully implemented")
end
