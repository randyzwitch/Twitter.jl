#############################################################
#
# Streaming Functions
#
#############################################################

function post_streaming_filtered()
	error("Twitter API not fully implemented")
end

function get_streaming_sample(; options = Dict())
	
	r = get_oauth("https://stream.twitter.com/1.1/statuses/sample.json", options)

end

function get_firehose()
	error("This method requires special Twitter permission. If you have that special permission, write this function and submit a PR.")
end

function get_user_streaming(; options = Dict())
	
	r = get_oauth("https://userstream.twitter.com/1.1/user.json", options)

end

function get_site_streaming(; options = Dict())
	
	r = get_oauth("https://sitestream.twitter.com/1.1/site.json", options)
	
end

