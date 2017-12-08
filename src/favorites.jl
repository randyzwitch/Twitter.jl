#############################################################
#
# Favorites Functions
#
#############################################################

function post_favorites_destroy(id::String; options=Dict{String, String}())

    options["id"] = id

    r = post_oauth("https://api.twitter.com/1.1/favorites/destroy.json", options)

    return r.status == 200 ? JSON.parse(String(r.body)) : error("Twitter API returned $(r.status) status")

end

function post_favorites_create(id::String; options=Dict{String, String}())

    options["id"] = id

    r = post_oauth("https://api.twitter.com/1.1/favorites/create.json", options)

    return r.status == 200 ? JSON.parse(String(r.body)) : error("Twitter API returned $(r.status) status")

end
