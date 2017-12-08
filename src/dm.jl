#############################################################
#
# Direct Messages Functions
#
#############################################################

function get_direct_messages_show(id::String; options=Dict{String, String}())

    #Add required parameter(s) to options dict
    options["id"] = id

    r = get_oauth("https://api.twitter.com/1.1/direct_messages/show.json", options)

    return r.status == 200 ? JSON.parse(String(r.body)) : error("Twitter API returned $(r.status) status")

end

function post_direct_messages_destroy(id::String; options=Dict{String, String}())

    options["id"] = id

    r = post_oauth("https://api.twitter.com/1.1/direct_messages/destroy.json", options)

    return r.status == 200 ? JSON.parse(String(r.body)) : error("Twitter API returned $(r.status) status")

end

function post_direct_messages_send(text::String; options=Dict{String, String}())

    #Add status into options Dict
    options["text"] = text

    r = post_oauth("https://api.twitter.com/1.1/direct_messages/new.json", options)

    return r.status == 200 ? JSON.parse(String(r.body)) : error("Twitter API returned $(r.status) status")

end
