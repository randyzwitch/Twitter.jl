#############################################################
#
# Favorites Functions
#
#############################################################

function get_favorites_list(; options=Dict{String, String}())
    
    r = get_oauth("https://api.twitter.com/1.1/favorites/list.json", options)

    #If 200 response, create Array{TWEETS,1}, otherwise return raw response 
    return r.status == 200 ? to_TWEETS(JSON.parse(r.data)) : r

end

function post_favorites_destroy(id::String; options=Dict{String, String}())
	
	options["id"] = id

    r = post_oauth("https://api.twitter.com/1.1/favorites/destroy.json", options)

    #If 200 response, create Array{TWEETS,1}, otherwise return raw response 
    return r.status == 200 ? to_TWEETS(JSON.parse(r.data)) : r

end

function post_favorites_create(id::String; options=Dict{String, String}())
	
	options["id"] = id

    r = post_oauth("https://api.twitter.com/1.1/favorites/create.json", options)

    #If 200 response, create Array{TWEETS,1}, otherwise return raw response 
    return r.status == 200 ? to_TWEETS(JSON.parse(r.data)) : r

end
