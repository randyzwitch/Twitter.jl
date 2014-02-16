#############################################################
#
# Saved Searches Functions
#
#############################################################

function get_saved_searches_list(; options = Dict())

    r = get_oauth("https://api.twitter.com/1.1/saved_searches/list.json", options)

end

function get_saved_searches_show_id(id::String; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/saved_searches/show/$(id).json", options)

end

function post_saved_searches_create()
	error("Twitter API not fully implemented")
end

function post_saved_searches_destroy_id()
	error("Twitter API not fully implemented")
end