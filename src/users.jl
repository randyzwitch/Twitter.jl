#############################################################
#
# Users Functions
#
#############################################################

function get_verify_credentials(; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/account/verify_credentials.json", options)

    #return to_USERS(r)
    return r.status == 200 ? to_USERS(Requests.json(r)) : r

end

function post_account_settings(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/account/settings.json", options)

    return r.status == 200 ? Requests.json(r) : r

end

function post_update_delivery_device(device::String; options=Dict{String, String}())

    #Add required parameter(s) to options dict
    options["device"] = device

    r = post_oauth("https://api.twitter.com/1.1/account/update_delivery_device.json", options)

    return r.status == 200 ? Requests.json(r) : r

end

function post_update_profile(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/account/update_profile.json", options)

    return r.status == 200 ? Requests.json(r) : r

end

function post_update_profile_background(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/account/update_profile_background_image.json", options)

    return r.status == 200 ? Requests.json(r) : r

end

function post_update_profile_colors(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/account/update_profile_colors.json", options)

    return r.status == 200 ? Requests.json(r) : r

end

#Need to enforce type around image as base64 encoded, not sure how
function post_update_profile_image(image; options=Dict{String, String}())

    #Add required parameter(s) to options dict
    options["image"] = image

    r = post_oauth("https://api.twitter.com/1.1/account/update_profile_image.json", options)

    return r.status == 200 ? Requests.json(r) : r

end

function get_blocks_list(; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/blocks/list.json", options)

    #return to_USERS(r["users"])
    return r.status == 200 ? to_USERS(Requests.json(r)["users"]) : r

end

function post_blocks_create(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/blocks/create.json", options)

    return r.status == 200 ? Requests.json(r) : r

end

function post_blocks_destroy(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/blocks/destroy.json", options)

    return r.status == 200 ? Requests.json(r) : r

end

function get_users_lookup(; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/users/lookup.json", options)

    #return to_USERS(r)
    return r.status == 200 ? to_USERS(Requests.json(r)) : r

end

function get_users_show(; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/users/show.json", options)

    #return to_USERS(r)
    return r.status == 200 ? to_USERS(Requests.json(r)) : r

end

function get_users_search(q::String; options=Dict{String, String}())

    #Add required parameter(s) to options dict
    options["q"] = q

    r = get_oauth("https://api.twitter.com/1.1/users/search.json", options)

    #return to_USERS(r)
    return r.status == 200 ? to_USERS(Requests.json(r)) : r

end

function get_users_contributees(; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/users/contributees.json", options)

    #return to_USERS(r)
    return r.status == 200 ? to_USERS(Requests.json(r)) : r

end

function get_users_contributors(; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/users/contributors.json", options)

    #return to_USERS(r)
    return r.status == 200 ? to_USERS(Requests.json(r)) : r

end

function post_account_remove_profile_banner(; options=Dict{String, String}())

    r = post_oauth("https://api.twitter.com/1.1/account/remove_profile_banner.json", options)

    return r.status == 200 ? Requests.json(r) : r

end

#Need to enforce type around image as base64 encoded, not sure how
function post_account_update_profile_banner(banner::String; options=Dict{String, String}())

    #Add required parameter(s) to options dict
    options["banner"] = banner

    r = post_oauth("https://api.twitter.com/1.1/account/update_profile_banner.json", options)

    return r.status == 200 ? Requests.json(r) : r

end