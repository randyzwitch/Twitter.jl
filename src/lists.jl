#############################################################
#
# Lists Functions
#
#############################################################

function get_lists(; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/lists/list.json", options)

    return r.status == 200 ? to_LISTS(JSON.parse(r.data)) : r

end

function get_lists_statuses(; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/lists/statuses.json", options)

    return r.status == 200 ? to_TWEETS(JSON.parse(r.data)) : r

end

function post_lists_members_destroy(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/lists/members/destroy.json", options)

    return r.status == 200 ? to_LISTS(JSON.parse(r.data)) : r

end

function get_lists_memberships(; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/lists/memberships.json", options)

    #return to_LISTS(r["lists"])
    return r.status == 200 ? to_LISTS(JSON.parse(r.data)["lists"]) : r

end

function get_lists_subscribers(; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/lists/subscribers.json", options)

    #return to_USERS(r["users"])
    return r.status == 200 ? to_USERS(JSON.parse(r.data)["users"]) : r

end

function post_lists_subscribers_create(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/lists/subscribers/create.json", options)

    return r.status == 200 ? to_LISTS(JSON.parse(r.data)) : r

end

function post_lists_subscribers_destroy(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/lists/subscribers/destroy.json", options)

    return r.status == 200 ? to_LISTS(JSON.parse(r.data)) : r

end

function post_lists_members_createall(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/lists/members/create_all.json", options)

    return r.status == 200 ? to_LISTS(JSON.parse(r.data)) : r

end

function get_lists_members_show(; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/lists/members/show.json", options)

    #return to_USERS(r)
    return r.status == 200 ? to_USERS(JSON.parse(r.data)) : r

end

function get_lists_members(; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/lists/members.json", options)

    #return to_USERS(r["users"])
    return r.status == 200 ? to_USERS(JSON.parse(r.data)["users"]) : r

end

function post_lists_members_create(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/lists/members/create.json", options)

    return r.status == 200 ? to_LISTS(JSON.parse(r.data)) : r

end

function post_lists_destroy(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/lists/destroy.json", options)

    return r.status == 200 ? to_LISTS(JSON.parse(r.data)) : r

end

function post_lists_update(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/lists/update.json", options)

    return r.status == 200 ? to_LISTS(JSON.parse(r.data)) : r

end

function post_lists_create(name::String; options=Dict{String, String}())

    options["name"] = name

    r = post_oauth("https://api.twitter.com/1.1/lists/create.json", options)

    return r.status == 200 ? JSON.parse(r.data) : r

end

function get_lists_show(; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/lists/show.json", options)

    return r.status == 200 ? to_LISTS(JSON.parse(r.data)) : r

end

function get_lists_subscriptions(; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/lists/subscriptions.json", options)

    #return to_LISTS(r["lists"])
    return r.status == 200 ? to_LISTS(JSON.parse(r.data)["lists"]) : r

end

function post_lists_members_destroyall(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/lists/members/destroy_all.json", options)

    return r.status == 200 ? to_LISTS(JSON.parse(r.data)) : r

end

function get_lists_ownerships(; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/lists/ownerships.json", options)

    #return to_LISTS(r["lists"])
    return r.status == 200 ? to_LISTS(JSON.parse(r.data)["lists"]) : r

end