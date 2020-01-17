endpoint_tuple = [
            #no required arguments: works fine
            (:get_oauth, :get_help_configuration, "help/configuration.json", nothing),
            (:get_oauth, :get_help_languages, "help/languages.json", nothing),
            (:get_oauth, :get_help_privacy, "help/privacy.json", nothing),
            (:get_oauth, :get_help_tos, "help/tos.json", nothing),
            (:get_oauth, :get_application_rate_limit_status, "application/rate_limit_status.json", nothing),
            (:get_oauth, :get_profile_banner, "users/profile_banner.json", nothing),
            (:get_oauth, :get_blocks_ids, "blocks/ids.json", nothing),
            (:get_oauth, :get_account_settings, "account/settings.json", nothing),
            (:get_oauth, :get_oembed, "statuses/oembed.json", nothing),
            (:get_oauth, :get_trends_available, "trends/available.json", nothing),
            (:get_oauth, :get_user_suggestions, "users/suggestions.json", nothing),
            (:get_oauth, :get_saved_searches_list, "saved_searches/list.json", nothing),
            (:get_oauth, :get_lists_subscribers_show, "lists/subscribers/show.json", nothing),
            (:get_oauth, :get_friendships_no_retweets, "friendships/no_retweets/ids.json", nothing),
            #(:get_oauth, :get_friends_ids, "friends/ids.json", nothing),
            #(:get_oauth, :get_followers_ids, "followers/ids.json", nothing),
            (:get_oauth, :get_friendships_lookup, "friendships/lookup.json", nothing),
            (:get_oauth, :get_friendships_incoming, "friendships/incoming.json", nothing),
            (:get_oauth, :get_friendships_outgoing, "friendships/outgoing.json", nothing),
            (:get_oauth, :get_friendships_show, "friendships/show.json", nothing),
            (:get_oauth, :get_direct_messages, "direct_messages.json", :Tweets),
            (:get_oauth, :get_direct_messages_sent, "direct_messages/sent.json", :Tweets),
            (:get_oauth, :get_favorites_list, "favorites/list.json", :Tweets),
            (:get_oauth, :get_friends_list, "friends/list.json", nothing),
            (:get_oauth, :get_followers_list, "followers/list.json", nothing),
            (:get_oauth, :get_lists, "lists/list.json", :Lists),
            (:get_oauth, :get_lists_statuses, "lists/statuses.json", :Tweets),
            (:get_oauth, :get_lists_memberships, "lists/memberships.json", nothing),
            (:get_oauth, :get_lists_subscribers, "lists/subscribers.json", nothing),
            (:get_oauth, :get_lists_members_show, "members/show.json", :Users),
            (:get_oauth, :get_lists_members, "lists/members.json", :Users),
            (:get_oauth, :get_lists_show, "lists/show.json", :Lists),
            (:get_oauth, :get_lists_subscriptions, "lists/subscriptions.json", nothing),
            (:get_oauth, :get_lists_ownerships, "lists/ownerships.json", nothing),
            (:get_oauth, :get_mentions_timeline, "statuses/mentions_timeline.json", :Tweets),
            #(:get_oauth, :get_user_timeline, "statuses/user_timeline.json", :Tweets),
            #(:get_oauth, :get_home_timeline, "statuses/home_timeline.json", :Tweets),
            (:get_oauth, :get_retweets_of_me, "statuses/retweets_of_me.json", :Tweets),
            (:get_oauth, :get_verify_credentials, "account/verify_credentials.json", :Users),
            (:get_oauth, :get_blocks_list, "blocks/list.json", nothing),
            (:get_oauth, :get_users_lookup, "users/lookup.json", :Users),
            (:get_oauth, :get_users_show, "users/show.json", :Users),
            (:get_oauth, :get_users_contributees, "users/contributees.json", nothing),
            (:get_oauth, :get_users_contributors, "users/contributors.json", nothing),
            (:post_oauth, :post_friendships_create, "friendships/create.json", :Users),
            (:post_oauth, :post_friendships_destroy, "friendships/destroy.json", :Users),
            (:post_oauth, :post_friendships_update, "friendships/update.json", nothing),
            (:post_oauth, :post_lists_members_destroy, "lists/members/destroy.json", :Lists),
            (:post_oauth, :post_lists_subscribers_create, "subscribers/create.json", :Lists),
            (:post_oauth, :post_lists_subscribers_destroy, "subscribers/destroy.json", :Lists),
            (:post_oauth, :post_lists_members_createall, "members/create_all.json", :Lists),
            (:post_oauth, :post_lists_members_create, "members/create.json", :Lists),
            (:post_oauth, :post_lists_destroy, "lists/destroy.json", :Lists),
            (:post_oauth, :post_lists_update, "lists/update.json", :Lists),
            (:post_oauth, :post_lists_members_destroy_all, "members/destroy_all.json", :Lists),
            (:post_oauth, :post_users_report_spam, "users/report_spam.json", :Users),
            (:post_oauth, :post_account_settings, "account/settings.json", nothing),
            (:post_oauth, :post_update_profile, "account/update_profile.json", nothing),
            (:post_oauth, :post_update_profile_background, "account/update_profile_background_image.json", nothing),
            (:post_oauth, :post_blocks_create, "blocks/create.json", nothing),
            (:post_oauth, :post_blocks_destroy, "blocks/destroy.json", nothing),
            (:post_oauth, :post_account_remove_profile_banner, "account/remove_profile_banner.json", nothing),
            #have required arguments: no argument checking currently
            (:get_oauth, :get_direct_messages_show, "direct_messages/events/show.json", :Tweets),
            (:post_oauth, :post_direct_messages_destroy, "direct_messages/destroy.json", :Tweets),
            (:post_oauth, :post_direct_messages_send, "direct_messages/events/new.json", :Tweets),
            (:post_oauth, :post_favorites_destroy, "favorites/destroy.json", :Tweets),
            (:post_oauth, :post_favorites_create, "favorites/create.json", :Tweets),
            (:get_oauth, :get_geo_reverse_geocode, "geo/reverse_geocode.json", nothing),
            (:get_oauth, :get_geo_search, "geo/search.json", nothing),
            (:get_oauth, :get_geo_similar_places, "geo/similar_places.json", nothing),
            (:post_oauth, :post_lists_create, "lists/create.json", nothing),
            (:get_oauth, :get_search_tweets, "search/tweets.json", nothing),
            (:get_oauth, :get_trends_place, "trends/place.json", nothing),
            (:get_oauth, :get_trends_closest, "trends/closest.json", nothing),
            (:get_oauth, :get_single_tweet_id, "statuses/show.json", :Tweets),
            (:post_oauth, :post_status_update, "statuses/update.json", :Tweets),
            (:get_oauth, :get_retweeters_id, "statuses/retweeters/ids.json", nothing),
            (:get_oauth, :get_users_search, "users/search.json", :Users),
            (:post_oauth, :post_update_profile_image, "account/update_profile_image.json", nothing),
            (:post_oauth, :post_account_update_profile_banner, "account/update_profile_banner.json", nothing)
]

#dynamically build methods
for (verb, func, endp, t) in endpoint_tuple
    @eval begin
            function ($func)(;kwargs...)

                #Take kwargs array of tuples, create dict needed by OAuth process
                options = Dict{String, Any}()
                for arg in kwargs
                    options[string(arg[1])] = string(arg[2])
                end

                #Call endpoint
                r = ($verb)($"https://api.twitter.com/1.1/$endp", options)

                #If successful API call, return JSON as Julia data structure, otherwise return error
                if r.status == 200
                    success = JSON.parse(String(r.body))

                    #If type known, parse
                    if ($t) != nothing && ($t) <: TwitterType
                        return ($t)(success)
                    else
                        return success
                    end
                else
                    error("Twitter API returned $(r.status) status")
                end

            end
    end
end
