#############################################################
#
# Direct Messages Functions
#
#############################################################

function get_direct_messages(; options=Dict{String, String}())
    
    r = get_oauth("https://api.twitter.com/1.1/direct_messages.json", options)

    return to_TWEETS(r)

end

function get_direct_messages_sent(; options=Dict{String, String}())
    
    r = get_oauth("https://api.twitter.com/1.1/direct_messages/sent.json", options)

    return to_TWEETS(r)

end

function get_direct_messages_show(id::String; options=Dict{String, String}())

	#Add required parameter(s) to options dict
    options["id"] = id
	
	r = get_oauth("https://api.twitter.com/1.1/direct_messages/show.json", options)

	return to_TWEETS(r)

end

function post_direct_messages_destroy(id::String; options=Dict{String, String}())
	
	options["id"] = id

    r = post_oauth("https://api.twitter.com/1.1/direct_messages/destroy.json", options)

    #Return array of type TWEETS
    return to_TWEETS(r)

end

function post_direct_messages_send(text::String; options=Dict{String, String}())
	
	#Add status into options Dict
    options["text"] = text

    r = post_oauth("https://api.twitter.com/1.1/direct_messages/new.json", options)

    #Return array of type TWEETS
    return to_TWEETS(r)

end