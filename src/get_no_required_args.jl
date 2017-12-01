#########################################################################
#
# GET Functions, No Required Arguments, Returns JSON Julia data structure
#
#########################################################################

endpoint_tuple = [
            (:get_help_configuration, "help/configuration.json"),
            (:get_help_languages, "help/languages.json"),
            (:get_help_privacy, "help/privacy.json"),
            (:get_help_tos, "help/tos.json"),
            (:get_application_rate_limit_status, "application/rate_limit_status.json"),
            (:get_profile_banner, "users/profile_banner.json"),
            (:get_blocks_ids, "blocks/ids.json"),
            (:get_account_settings, "account/settings.json"),
            (:get_oembed, "statuses/oembed.json"),
            (:get_trends_available, "trends/available.json"),
            (:get_user_suggestions, "users/suggestions.json"),
            (:get_saved_searches_list, "saved_searches/list.json"),
            (:get_lists_subscribers_show, "lists/subscribers/show.json"),
            (:get_friendships_no_retweets, "friendships/no_retweets/ids.json"),
            (:get_friends_ids, "friends/ids.json"),
            (:get_followers_ids, "followers/ids.json"),
            (:get_friendships_lookup, "friendships/lookup.json"),
            (:get_friendships_incoming, "friendships/incoming.json"),
            (:get_friendships_outgoing, "friendships/outgoing.json"),
            (:get_friendships_show, "friendships/show.json")
]

for (func, endp) in endpoint_tuple
    @eval begin
            function ($func)(; options=Dict{String, String}())

                r = get_oauth($"https://api.twitter.com/1.1/$endp", options)

                return r.status == 200 ? JSON.parse(String(r.data)) : error("Twitter API returned $(r.status) status")

            end
    end
end
