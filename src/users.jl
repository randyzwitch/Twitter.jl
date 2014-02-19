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

end

function post_account_settings()
	error("Twitter API not fully implemented")
end

function post_update_delivery_device()
	error("Twitter API not fully implemented")
end

function post_update_profile()
	error("Twitter API not fully implemented")
end

function post_update_profile_background()
	error("Twitter API not fully implemented")
end

function post_update_profile_colors()
	error("Twitter API not fully implemented")
end

function post_update_profile_image()
	error("Twitter API not fully implemented")
end

function get_blocks_list(; options = Dict())

    r = get_oauth("https://api.twitter.com/1.1/blocks/list.json", options)

end

function get_blocks_ids(; options = Dict())

    r = get_oauth("https://api.twitter.com/1.1/blocks/ids.json", options)

end

function post_blocks_create()
	error("Twitter API not fully implemented")
end

function post_blocks_destroy()
	error("Twitter API not fully implemented")
end

function get_users_lookup(; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/users/lookup.json", options)

end

function get_users_show(; options = Dict())
	
	r = get_oauth("https://api.twitter.com/1.1/users/show.json", options)

end

function get_users_search(q::String; options = Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/users/search.json", setindex!(options, "$q", "q"))

end

function get_users_contributees(; options = Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/users/contributees.json", options)

end

function get_users_contributors(; options = Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/users/contributors.json", options)

end

function post_account_remove_profile_banner()
	error("Twitter API not fully implemented")
end

function post_account_update_profile_banner()
	error("Twitter API not fully implemented")
end

function get_profile_banner(; options = Dict())
    
    r = get_oauth("https://api.twitter.com/1.1/users/profile_banner.json", options)

end
