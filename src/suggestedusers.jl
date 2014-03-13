#############################################################
#
# Suggested Users Functions
#
#############################################################

function get_user_suggestions_slug(slug::String; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/users/suggestions/$(slug).json", options)

    #return to_USERS(r["users"])

    return r.status == 200 ? to_USERS(JSON.parse(r.data)["users"]) : r

end

function get_user_suggestions(; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/users/suggestions.json", options)

    return r.status == 200 ? JSON.parse(r.data) : r

end

function get_user_suggestions_slug_members(slug::String; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/users/suggestions/$(slug)/members.json", options)

    #return to_USERS(r)

    return r.status == 200 ? to_USERS(JSON.parse(r.data)) : r

end