#############################################################
#
# Users Functions
#
#############################################################

function get_account_settings(; options = Dict())

    r = get_oauth("https://api.twitter.com/1.1/account/settings.json", options)

end

function get_verify_credentials(; options = Dict())

    r = get_oauth("https://api.twitter.com/1.1/account/verify_credentials.json", options)

    return to_USERS(r)

end

function post_account_settings(; options = Dict())
	
    r = post_oauth("https://api.twitter.com/1.1/account/settings.json", options)

end

function post_update_delivery_device(device::String; options = Dict())
	
	#Add required parameter(s) to options dict
	options["device"] = device

	r = post_oauth("https://api.twitter.com/1.1/account/update_delivery_device.json", options)

end

function post_update_profile(; options = Dict())
	
	r = post_oauth("https://api.twitter.com/1.1/account/update_profile.json", options)

end

function post_update_profile_background(; options = Dict())
	
	r = post_oauth("https://api.twitter.com/1.1/account/update_profile_background_image.json", options)

end

function post_update_profile_colors(; options = Dict())
	
	r = post_oauth("https://api.twitter.com/1.1/account/update_profile_colors.json", options)

end

#Need to enforce type around image as base64 encoded, not sure how
function post_update_profile_image(image; options = Dict())

	#Add required parameter(s) to options dict
	options["image"] = image
	
	r = post_oauth("https://api.twitter.com/1.1/account/update_profile_image.json", options)

end

function get_blocks_list(; options = Dict())

    r = get_oauth("https://api.twitter.com/1.1/blocks/list.json", options)

    return to_USERS(r["users"])

end

function get_blocks_ids(; options = Dict())

    r = get_oauth("https://api.twitter.com/1.1/blocks/ids.json", options)

end

function post_blocks_create(; options = Dict())
	
	r = post_oauth("https://api.twitter.com/1.1/blocks/create.json", options)

end

function post_blocks_destroy(; options = Dict())
	
	r = post_oauth("https://api.twitter.com/1.1/blocks/destroy.json", options)

end

function get_users_lookup(; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/users/lookup.json", options)

	return to_USERS(r)

end

function get_users_show(; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/users/show.json", options)

	return to_USERS(r)

end

function get_users_search(q::String; options = Dict())

	#Add required parameter(s) to options dict
	options["q"] = q
    
    r = get_oauth("https://api.twitter.com/1.1/users/search.json", options)

    return to_USERS(r)

end

function get_users_contributees(; options = Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/users/contributees.json", options)

    return to_USERS(r)

end

function get_users_contributors(; options = Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/users/contributors.json", options)

    return to_USERS(r)

end

function post_account_remove_profile_banner(; options = Dict())
	
	r = post_oauth("https://api.twitter.com/1.1/account/remove_profile_banner.json", options)

end

#Need to enforce type around image as base64 encoded, not sure how
function post_account_update_profile_banner(banner::String; options = Dict())
	
	#Add required parameter(s) to options dict
	options["banner"] = banner

	r = post_oauth("https://api.twitter.com/1.1/account/update_profile_banner.json", options)

end

function get_profile_banner(; options = Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/users/profile_banner.json", options)

end
