#############################################################
#
# Direct Messages Functions
#
#############################################################

function get_direct_messages(count::Int; options=Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/direct_messages.json", setindex!(options, "$count", "count"))

    return parse_response(r, "TWEETS")

end

function get_direct_messages_sent(count::Int; options=Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/direct_messages/sent.json", setindex!(options, "$count", "count"))

    return parse_response(r, "TWEETS")

end

function get_direct_messages_show()
	error("Twitter API not fully implemented")
end

function post_direct_messages_destroy()
	error("Twitter API not fully implemented")
end

function post_direct_messages_send()
	error("Twitter API not fully implemented")
end