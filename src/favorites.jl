#############################################################
#
# Favorites Functions
#
#############################################################

function get_favorites_list(; options = Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/favorites/list.json", options)

    return to_TWEETS(r)

end

function post_favorites_destroy()
	error("Twitter API not fully implemented")
end

function post_favorites_create()
	error("Twitter API not fully implemented")
end
