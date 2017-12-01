#############################################################
#
# Suggested Users Functions
#
#############################################################

function get_user_suggestions_slug(slug::String; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/users/suggestions/$(slug).json", options)

    return r.status == 200 ? JSON.parse(String(r.data)) : error("Twitter API returned $(r.status) status")

end

function get_user_suggestions_slug_members(slug::String; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/users/suggestions/$(slug)/members.json", options)

    return r.status == 200 ? JSON.parse(String(r.data)) : error("Twitter API returned $(r.status) status")

end
