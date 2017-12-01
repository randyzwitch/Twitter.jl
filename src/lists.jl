#############################################################
#
# Lists Functions
#
#############################################################

function post_lists_members_destroy(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/lists/members/destroy.json", options)

    return r.status == 200 ? JSON.parse(String(r.data)) : error("Twitter API returned $(r.status) status")

end

function post_lists_subscribers_create(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/lists/subscribers/create.json", options)

    return r.status == 200 ? JSON.parse(String(r.data)) : error("Twitter API returned $(r.status) status")

end

function post_lists_subscribers_destroy(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/lists/subscribers/destroy.json", options)

    return r.status == 200 ? JSON.parse(String(r.data)) : error("Twitter API returned $(r.status) status")

end

function post_lists_members_createall(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/lists/members/create_all.json", options)

    return r.status == 200 ? JSON.parse(String(r.data)) : error("Twitter API returned $(r.status) status")

end

function post_lists_members_create(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/lists/members/create.json", options)

    return r.status == 200 ? JSON.parse(String(r.data)) : error("Twitter API returned $(r.status) status")

end

function post_lists_destroy(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/lists/destroy.json", options)

    return r.status == 200 ? JSON.parse(String(r.data)) : error("Twitter API returned $(r.status) status")

end

function post_lists_update(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/lists/update.json", options)

    return r.status == 200 ? JSON.parse(String(r.data)) : error("Twitter API returned $(r.status) status")

end

function post_lists_create(name::String; options=Dict{String, String}())

    options["name"] = name

    r = post_oauth("https://api.twitter.com/1.1/lists/create.json", options)

    return r.status == 200 ? JSON.parse(String(r.data)) : error("Twitter API returned $(r.status) status")

end

function post_lists_members_destroyall(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/lists/members/destroy_all.json", options)

    return r.status == 200 ? JSON.parse(String(r.data)) : error("Twitter API returned $(r.status) status")

end
