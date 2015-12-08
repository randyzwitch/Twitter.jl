#############################################################
#
# Saved Searches Functions
#
#############################################################

function get_saved_searches_show_id(id::AbstractString; options=Dict{AbstractString, AbstractString}())

    r = get_oauth("https://api.twitter.com/1.1/saved_searches/show/$(id).json", options)

    return r.status == 200 ? Requests.json(r) : r

end

function post_saved_searches_create(query::AbstractString; options=Dict{AbstractString, AbstractString}())

    options["query"] = query

    r = post_oauth("https://api.twitter.com/1.1/saved_searches/create.json", options)

    return r.status == 200 ? Requests.json(r) : r

end

function post_saved_searches_destroy_id(id::AbstractString; options=Dict{AbstractString, AbstractString}())

    r = post_oauth("https://api.twitter.com/1.1/saved_searches/destroy/$(id).json", options)

    return r.status == 200 ? Requests.json(r) : r

end