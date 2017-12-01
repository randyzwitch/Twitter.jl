#############################################################
#
# Friends & Followers Functions
#
#############################################################

function post_friendships_create(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/friendships/create.json", options)

    return r.status == 200 ? JSON.parse(String(r.data)) : error("Twitter API returned $(r.status) status")

end

function post_friendships_destroy(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/friendships/destroy.json", options)

    return r.status == 200 ? JSON.parse(String(r.data)) : error("Twitter API returned $(r.status) status")

end

function post_friendships_update(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/friendships/destroy.json", options)

    return r.status == 200 ? JSON.parse(String(r.data)) : error("Twitter API returned $(r.status) status")

end
