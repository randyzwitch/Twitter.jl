#############################################################
#
# Lists Functions
#
#############################################################

function get_lists(; options=Dict{AbstractString, AbstractString}())

    r = get_oauth("https://api.twitter.com/1.1/lists/list.json", options)

    return r.status == 200 ? to_LISTS(Requests.json(r)) : r

end

function get_lists_statuses(; options=Dict{AbstractString, AbstractString}())

    r = get_oauth("https://api.twitter.com/1.1/lists/statuses.json", options)

    return r.status == 200 ? to_TWEETS(Requests.json(r)) : r

end

function post_lists_members_destroy(; options=Dict{AbstractString, AbstractString}())

    r = post_oauth("https://api.twitter.com/1.1/lists/members/destroy.json", options)

    return r.status == 200 ? to_LISTS(Requests.json(r)) : r

end

function get_lists_memberships(; options=Dict{AbstractString, AbstractString}())

    r = get_oauth("https://api.twitter.com/1.1/lists/memberships.json", options)

    #return to_LISTS(r["lists"])
    return r.status == 200 ? to_LISTS(Requests.json(r)["lists"]) : r

end

function get_lists_subscribers(; options=Dict{AbstractString, AbstractString}())

    r = get_oauth("https://api.twitter.com/1.1/lists/subscribers.json", options)

    #return to_USERS(r["users"])
    return r.status == 200 ? to_USERS(Requests.json(r)["users"]) : r

end

function post_lists_subscribers_create(; options=Dict{AbstractString, AbstractString}())

    r = post_oauth("https://api.twitter.com/1.1/lists/subscribers/create.json", options)

    return r.status == 200 ? to_LISTS(Requests.json(r)) : r

end

function post_lists_subscribers_destroy(; options=Dict{AbstractString, AbstractString}())

    r = post_oauth("https://api.twitter.com/1.1/lists/subscribers/destroy.json", options)

    return r.status == 200 ? to_LISTS(Requests.json(r)) : r

end

function post_lists_members_createall(; options=Dict{AbstractString, AbstractString}())

    r = post_oauth("https://api.twitter.com/1.1/lists/members/create_all.json", options)

    return r.status == 200 ? to_LISTS(Requests.json(r)) : r

end

function get_lists_members_show(; options=Dict{AbstractString, AbstractString}())

    r = get_oauth("https://api.twitter.com/1.1/lists/members/show.json", options)

    #return to_USERS(r)
    return r.status == 200 ? to_USERS(Requests.json(r)) : r

end

function get_lists_members(; options=Dict{AbstractString, AbstractString}())

    r = get_oauth("https://api.twitter.com/1.1/lists/members.json", options)

    #return to_USERS(r["users"])
    return r.status == 200 ? to_USERS(Requests.json(r)["users"]) : r

end

function post_lists_members_create(; options=Dict{AbstractString, AbstractString}())

    r = post_oauth("https://api.twitter.com/1.1/lists/members/create.json", options)

    return r.status == 200 ? to_LISTS(Requests.json(r)) : r

end

function post_lists_destroy(; options=Dict{AbstractString, AbstractString}())

    r = post_oauth("https://api.twitter.com/1.1/lists/destroy.json", options)

    return r.status == 200 ? to_LISTS(Requests.json(r)) : r

end

function post_lists_update(; options=Dict{AbstractString, AbstractString}())

    r = post_oauth("https://api.twitter.com/1.1/lists/update.json", options)

    return r.status == 200 ? to_LISTS(Requests.json(r)) : r

end

function post_lists_create(name::AbstractString; options=Dict{AbstractString, AbstractString}())

    options["name"] = name

    r = post_oauth("https://api.twitter.com/1.1/lists/create.json", options)

    return r.status == 200 ? Requests.json(r) : r

end

function get_lists_show(; options=Dict{AbstractString, AbstractString}())

    r = get_oauth("https://api.twitter.com/1.1/lists/show.json", options)

    return r.status == 200 ? to_LISTS(Requests.json(r)) : r

end

function get_lists_subscriptions(; options=Dict{AbstractString, AbstractString}())

    r = get_oauth("https://api.twitter.com/1.1/lists/subscriptions.json", options)

    #return to_LISTS(r["lists"])
    return r.status == 200 ? to_LISTS(Requests.json(r)["lists"]) : r

end

function post_lists_members_destroyall(; options=Dict{AbstractString, AbstractString}())

    r = post_oauth("https://api.twitter.com/1.1/lists/members/destroy_all.json", options)

    return r.status == 200 ? to_LISTS(Requests.json(r)) : r

end

function get_lists_ownerships(; options=Dict{AbstractString, AbstractString}())

    r = get_oauth("https://api.twitter.com/1.1/lists/ownerships.json", options)

    #return to_LISTS(r["lists"])
    return r.status == 200 ? to_LISTS(Requests.json(r)["lists"]) : r

end