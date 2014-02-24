#############################################################
#
# Direct Messages Functions
#
#############################################################

function get_direct_messages(; options=Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/direct_messages.json", options)

    return to_TWEETS(r)

end

function get_direct_messages_sent(; options=Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/direct_messages/sent.json", options)

    return to_TWEETS(r)

end

function get_direct_messages_show(id::String; options=Dict())

	#Add required parameter(s) to options dict
    options["id"] = id
	
	r = get_oauth("https://api.twitter.com/1.1/direct_messages/show.json", options)

	return to_TWEETS(r)

end

function post_direct_messages_destroy()
	error("Twitter API not fully implemented")
end

function post_direct_messages_send()
	error("Twitter API not fully implemented")
end