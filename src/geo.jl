#############################################################
#
# Places & Geo Functions
#
#############################################################

function get_geo_id_place_id(place_id::String; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/geo/id/$(place_id).json", options)

end

function get_geo_reverse_geocode(; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/geo/reverse_geocode.json", options)

end

function get_geo_search(; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/geo/search.json", options)

end

function get_geo_similar_places(; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/geo/similar_places.json", options)

end

function post_geo_place()
	error("Twitter API not fully implemented")
end


