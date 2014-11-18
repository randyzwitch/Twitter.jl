#############################################################
#
# Saved Searches Functions
#
#############################################################

function get_saved_searches_show_id(id::String; options=Dict{String, String}())
	
	r = get_oauth("https://api.twitter.com/1.1/saved_searches/show/$(id).json", options)

	return r.status == 200 ? JSON.parse(r.data) : r

end

function post_saved_searches_create(query::String; options=Dict{String, String}())
	
	options["query"] = query

    r = post_oauth("https://api.twitter.com/1.1/saved_searches/create.json", options)

    return r.status == 200 ? JSON.parse(r.data) : r

end

function post_saved_searches_destroy_id(id::String; options=Dict{String, String}())
	
	r = post_oauth("https://api.twitter.com/1.1/saved_searches/destroy/$(id).json", options)

	return r.status == 200 ? JSON.parse(r.data) : r

end