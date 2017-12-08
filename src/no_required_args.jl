endpoint_tuple = [
            #no required arguments
            (:get_oauth, :get_help_configuration, "help/configuration.json"),
            (:get_oauth, :get_help_languages, "help/languages.json"),
            (:get_oauth, :get_help_privacy, "help/privacy.json"),
            (:get_oauth, :get_help_tos, "help/tos.json"),
            (:get_oauth, :get_application_rate_limit_status, "application/rate_limit_status.json"),
            (:get_oauth, :get_profile_banner, "users/profile_banner.json"),
            (:get_oauth, :get_blocks_ids, "blocks/ids.json"),
            (:get_oauth, :get_account_settings, "account/settings.json"),
            (:get_oauth, :get_oembed, "statuses/oembed.json"),
            (:get_oauth, :get_trends_available, "trends/available.json"),
            (:get_oauth, :get_user_suggestions, "users/suggestions.json"),
            (:get_oauth, :get_saved_searches_list, "saved_searches/list.json"),
            (:get_oauth, :get_lists_subscribers_show, "lists/subscribers/show.json"),
            (:get_oauth, :get_friendships_no_retweets, "friendships/no_retweets/ids.json"),
            (:get_oauth, :get_friends_ids, "friends/ids.json"),
            (:get_oauth, :get_followers_ids, "followers/ids.json"),
            (:get_oauth, :get_friendships_lookup, "friendships/lookup.json"),
            (:get_oauth, :get_friendships_incoming, "friendships/incoming.json"),
            (:get_oauth, :get_friendships_outgoing, "friendships/outgoing.json"),
            (:get_oauth, :get_friendships_show, "friendships/show.json"),
            (:get_oauth, :get_direct_messages, "direct_messages.json"),
            (:get_oauth, :get_direct_messages_sent, "direct_messages/sent.json"),
            (:get_oauth, :get_favorites_list, "favorites/list.json"),
            (:get_oauth, :get_friends_list, "friends/list.json"),
            (:get_oauth, :get_followers_list, "followers/list.json"),
            (:get_oauth, :get_lists, "lists/list.json"),
            (:get_oauth, :get_lists_statuses, "lists/statuses.json"),
            (:get_oauth, :get_lists_memberships, "lists/memberships.json"),
            (:get_oauth, :get_lists_subscribers, "lists/subscribers.json"),
            (:get_oauth, :get_lists_members_show, "members/show.json"),
            (:get_oauth, :get_lists_members, "lists/members.json"),
            (:get_oauth, :get_lists_show, "lists/show.json"),
            (:get_oauth, :get_lists_subscriptions, "lists/subscriptions.json"),
            (:get_oauth, :get_lists_ownerships, "lists/ownerships.json"),
            (:get_oauth, :get_mentions_timeline, "statuses/mentions_timeline.json"),
            (:get_oauth, :get_user_timeline, "statuses/user_timeline.json"),
            (:get_oauth, :get_home_timeline, "statuses/home_timeline.json"),
            (:get_oauth, :get_retweets_of_me, "statuses/retweets_of_me.json"),
            (:get_oauth, :get_verify_credentials, "account/verify_credentials.json"),
            (:get_oauth, :get_blocks_list, "blocks/list.json"),
            (:get_oauth, :get_users_lookup, "users/lookup.json"),
            (:get_oauth, :get_users_show, "users/show.json"),
            (:get_oauth, :get_users_contributees, "users/contributees.json"),
            (:get_oauth, :get_users_contributors, "users/contributors.json"),
            (:post_oauth, :post_friendships_create, "friendships/create.json"),
            (:post_oauth, :post_friendships_destroy, "friendships/destroy.json"),
            (:post_oauth, :post_friendships_update, "friendships/update.json"),
            (:post_oauth, :post_lists_members_destroy, "lists/members/destroy.json"),
            (:post_oauth, :post_lists_subscribers_create, "subscribers/create.json"),
            (:post_oauth, :post_lists_subscribers_destroy, "subscribers/destroy.json"),
            (:post_oauth, :post_lists_members_createall, "members/create_all.json"),
            (:post_oauth, :post_lists_members_create, "members/create.json"),
            (:post_oauth, :post_lists_destroy, "lists/destroy.json"),
            (:post_oauth, :post_lists_update, "lists/update.json"),
            (:post_oauth, :post_lists_members_destroy_all, "members/destroy_all.json"),
            (:post_oauth, :post_users_report_spam, "users/report_spam.json"),
            (:post_oauth, :post_account_settings, "account/settings.json"),
            (:post_oauth, :post_update_profile, "account/update_profile.json"),
            (:post_oauth, :post_update_profile_background, "account/update_profile_background_image.json"),
            (:post_oauth, :post_blocks_create, "blocks/create.json"),
            (:post_oauth, :post_blocks_destroy, "blocks/destroy.json"),
            (:post_oauth, :post_account_remove_profile_banner, "account/remove_profile_banner.json"),
            #have required arguments
            (:get_oauth, :get_direct_messages_show, "direct_messages/show.json"),
            (:post_oauth, :post_direct_messages_destroy, "direct_messages/destroy.json"),
            (:post_oauth, :post_direct_messages_send, "direct_messages/new.json"),
            (:post_oauth, :post_favorites_destroy, "favorites/destroy.json"),
            (:post_oauth, :post_favorites_create, "favorites/create.json"),
            (:get_oauth, :get_geo_reverse_geocode, "geo/reverse_geocode.json"),
            (:get_oauth, :get_geo_search, "geo/search.json"),
            (:get_oauth, :get_geo_similar_places, "geo/similar_places.json"),
            (:post_oauth, :post_lists_create, "lists/create.json"),
            (:get_oauth, :get_search_tweets, "search/tweets.json"),
            (:get_oauth, :get_trends_place, "trends/place.json"),
            (:get_oauth, :get_trends_closest, "trends/closest.json"),
            (:get_oauth, :get_single_tweet_id, "statuses/show.json"),
            (:post_oauth, :post_status_update, "statuses/update.json"),
            (:get_oauth, :get_retweeters_id, "statuses/retweeters/ids.json"),
            (:get_oauth, :get_users_search, "users/search.json"),




]

for (verb, func, endp) in endpoint_tuple
    @eval begin
            function ($func)(;kwargs...)

                options = Dict{String, Any}()

                for arg in kwargs
                    options[string(arg[1])] = string(arg[2])
                end

                r = ($verb)($"https://api.twitter.com/1.1/$endp", options)

                return r.status == 200 ? JSON.parse(String(r.body)) : error("Twitter API returned $(r.status) status")

            end
    end
end
