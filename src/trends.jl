#############################################################
#
# Trends Functions
#
#############################################################

function get_trends_place(id::String; options = Dict())

	#Add required parameter(s) to options dict
    options["id"] = id
	
	r = get_oauth("https://api.twitter.com/1.1/trends/place.json", options)

end

function get_trends_available(; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/trends/available.json", options)

end

function get_trends_closest(lat::String, long::String; options = Dict())

	#Add required parameter(s) to options dict
    options["lat"] = lat
    options["long"] = long
	
	r = get_oauth("https://api.twitter.com/1.1/trends/closest.json", options)

end