#########################################################################
#
# GET Functions, No Required Arguments, Returns JSON Julia data structure
#
#########################################################################

funcname = (:get_help_configuration,
            :get_help_languages,
            :get_help_privacy,
            :get_help_tos,
            :get_application_rate_limit_status,
            :get_profile_banner,
            :get_blocks_ids,
            :get_account_settings,
            :get_oembed,
            :get_trends_available,
            :get_user_suggestions,
            :get_saved_searches_list,
            :get_lists_subscribers_show,
            :get_friendships_no_retweets,
            :get_friends_ids,
            :get_followers_ids,
            :get_friendships_lookup,
            :get_friendships_incoming,
            :get_friendships_outgoing,
            :get_friendships_show)

endpoint = ("help/configuration.json",
            "help/languages.json",
            "help/privacy.json",
            "help/tos.json",
            "application/rate_limit_status.json",
            "users/profile_banner.json",
            "blocks/ids.json",
            "account/settings.json",
            "statuses/oembed.json",
            "trends/available.json",
            "users/suggestions.json",
            "saved_searches/list.json",
            "lists/subscribers/show.json",
            "friendships/no_retweets/ids.json",
            "friends/ids.json",
            "followers/ids.json",
            "friendships/lookup.json",
            "friendships/incoming.json",
            "friendships/outgoing.json",
            "friendships/show.json")

for (func, endp) in zip(funcname, endpoint)
@eval begin function ($func)(; options=Dict{String, String}())

        r = get_oauth($"https://api.twitter.com/1.1/$endp", options)

        return r.status == 200 ? JSON.parse(String(r.data)) : error("Twitter API returned $(r.status) status")

        end
    end
end
