#############################################################
#
# Users Functions
#
#############################################################

#Need to enforce type around image as base64 encoded, not sure how
function post_update_profile_image(image; options=Dict{String, String}())

    #Add required parameter(s) to options dict
    options["image"] = image

    r = post_oauth("https://api.twitter.com/1.1/account/update_profile_image.json", options)

    return r.status == 200 ? JSON.parse(String(r.body)) : error("Twitter API returned $(r.status) status")

end

function get_users_search(q::String; options=Dict{String, String}())

    #Add required parameter(s) to options dict
    options["q"] = q

    r = get_oauth("https://api.twitter.com/1.1/users/search.json", options)

    #return to_USERS(r)
    return r.status == 200 ? JSON.parse(String(r.body)) : error("Twitter API returned $(r.status) status")

end

#Need to enforce type around image as base64 encoded, not sure how
function post_account_update_profile_banner(banner::String; options=Dict{String, String}())

    #Add required parameter(s) to options dict
    options["banner"] = banner

    r = post_oauth("https://api.twitter.com/1.1/account/update_profile_banner.json", options)

    return r.status == 200 ? JSON.parse(String(r.body)) : error("Twitter API returned $(r.status) status")

end
