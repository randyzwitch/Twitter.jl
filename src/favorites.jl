#############################################################
#
# Favorites Functions
#
#############################################################

function get_favorites_list(; options=Dict{String, String}())
    
    r = get_oauth("https://api.twitter.com/1.1/favorites/list.json", options)

    return to_TWEETS(r)

end

function post_favorites_destroy(id::String; options=Dict{String, String}())
	
	options["id"] = id

    r = post_oauth("https://api.twitter.com/1.1/favorites/destroy.json", options)

    #Return array of type TWEETS
    return to_TWEETS(r)

end

function post_favorites_create(id::String; options=Dict{String, String}())
	
	options["id"] = id

    r = post_oauth("https://api.twitter.com/1.1/favorites/create.json", options)

    #Return array of type TWEETS
    return to_TWEETS(r)

end
