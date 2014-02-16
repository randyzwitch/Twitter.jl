#############################################################
#
# Trends Functions
#
#############################################################

function get_trends_place(; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/trends/place.json", options)

end

function get_trends_available(; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/trends/available.json", options)

end

function get_trends_closest(; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/trends/closest.json", options)

end