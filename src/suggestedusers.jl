#############################################################
#
# Suggested Users Functions
#
#############################################################

function get_user_suggestions_slug(slug::String; options = Dict())

    r = get_oauth("https://api.twitter.com/1.1/users/suggestions/$(slug).json", options)

    return parse_response(r, "SUGGESTEDUSERS")

end

function get_user_suggestions(; options = Dict())

    r = get_oauth("https://api.twitter.com/1.1/users/suggestions.json", options)

    return parse_response(r, "SUGGESTEDUSERS")

end

function get_user_suggestions_slug_members(slug::String; options = Dict())

    r = get_oauth("https://api.twitter.com/1.1/users/suggestions/$(slug)/members.json", options)

    return parse_response(r, "USERS")

end