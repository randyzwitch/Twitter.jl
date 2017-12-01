#############################################################
#
# Lists Functions
#
#############################################################

function post_lists_create(name::String; options=Dict{String, String}())

    options["name"] = name

    r = post_oauth("https://api.twitter.com/1.1/lists/create.json", options)

    return r.status == 200 ? JSON.parse(String(r.data)) : error("Twitter API returned $(r.status) status")

end
