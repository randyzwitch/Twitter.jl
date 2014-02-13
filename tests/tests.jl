#Authentication using only consumer_key and consumer_secret
#Will only allow authentication of application_only endpoints, not user specific
twitterauth("6nOtpXmf...", "sES5Zlj096St...")

#Authentication using all 4 credentials
twitterauth("6nOtpXmf...", 
            "sES5Zlj096S...";
            oauth_token = "98689850-Hj...",
            oauth_secret = "UroqCVpWKIt...")

#Search by user
#https://dev.twitter.com/docs/api/1.1/get/statuses/user_timeline
get_user_timeline_tweets = get_user_timeline("randyzwitch")

#Search for tweets containing search term '#Duke'
#https://dev.twitter.com/docs/api/1.1/get/search/tweets
search_tweets_result = search_tweets("#Duke")

#Get id numbers for friends
#https://dev.twitter.com/docs/api/1.1/get/friends/ids
get_friends_ids_result = get_friends_ids("randyzwitch")

#Get id numbers for followers
get_followers_ids_result = get_followers_ids("randyzwitch")

#Get friends list
#https://dev.twitter.com/docs/api/1.1/get/friends/list
get_friends_list_result = get_friends_list("randyzwitch")

#Get followers list
#https://dev.twitter.com/docs/api/1.1/get/followers/list
get_followers_list_result = get_followers_list("randyzwitch")

#Configuration settings
#https://dev.twitter.com/docs/api/1.1/get/help/configuration
get_help_configuration_results = get_help_configuration()

#Languages
#https://dev.twitter.com/docs/api/1.1/get/help/languages
get_help_languages_results = get_help_languages()

#Privacy Policy
#https://dev.twitter.com/docs/api/1.1/get/help/privacy
get_help_privacy_results = get_help_privacy()

#Terms of Service
#https://dev.twitter.com/docs/api/1.1/get/help/tos
get_help_tos_results = get_help_tos()

#Application rate limit status
#https://dev.twitter.com/docs/api/1.1/get/application/rate_limit_status
rate_limit = get_application_rate_limit_status()

#Post tweet to timeline
#https://dev.twitter.com/docs/api/1.1/post/statuses/update
post_tweet = post_status_update("If this is annoying, sorry. Tweeting from inside #julialang using only Julia code.")

#Get n most recent tweets mentioning you
#https://dev.twitter.com/docs/api/1.1/get/statuses/mentions_timeline
last_20_mentions = mentions_timeline(20)

#Get n most recent tweets in your timeline
#https://dev.twitter.com/docs/api/1.1/get/statuses/home_timeline
timeline_tweets = mentions_timeline(20)

#Get n most recent retweets
#https://dev.twitter.com/docs/api/1.1/get/statuses/retweets_of_me
my_retweets = retweets_of_me(10)

#Get n most recent direct messages
#https://dev.twitter.com/docs/api/1.1/get/direct_messages
my_dms = get_direct_messages(10)

#Get n most recent direct messages sent
#https://dev.twitter.com/docs/api/1.1/get/direct_messages/sent
my_dms_sent = get_direct_messages_sent(10)

#Get account settings
#https://dev.twitter.com/docs/api/1.1/get/account/settings
account_settings = get_account_settings()

#Validate credentials
#https://dev.twitter.com/docs/api/1.1/get/account/verify_credentials
validated_credentials = validate_credentials()

#Get Blocks List
#https://dev.twitter.com/docs/api/1.1/get/blocks/list
blocked_users = get_blocks_list()

#Get Blocks IDs
#https://dev.twitter.com/docs/api/1.1/get/blocks/ids
blocked_ids = get_blocks_ids()

#Get Users Search
#https://dev.twitter.com/docs/api/1.1/get/users/search
philly_users = get_users_search("philly")

#Get users contributees
#https://dev.twitter.com/docs/api/1.1/get/users/contributees
user_contributees = get_users_contributees("randyzwitch")

#Get users contributors
#https://dev.twitter.com/docs/api/1.1/get/users/contributors
user_contributors = get_users_contributors("randyzwitch")

#Get profile banner
#https://dev.twitter.com/docs/api/1.1/get/users/profile_banner
profile_banner = get_profile_banner("randyzwitch")

#Get user suggestions slug
#https://dev.twitter.com/docs/api/1.1/get/users/suggestions/%3Aslug
user_suggestions_slug = get_user_suggestions_slug("twitter")

#Get user suggestions
#https://dev.twitter.com/docs/api/1.1/get/users/suggestions
user_suggestions = get_user_suggestions()

#Get favorites list
#https://dev.twitter.com/docs/api/1.1/get/favorites/list
get_favorites = get_favorites_list("randyzwitch")

#Get Lists
#https://dev.twitter.com/docs/api/1.1/get/lists/list
lists = get_lists("randyzwitch")

#Get Lists Memberships
#https://dev.twitter.com/docs/api/1.1/get/lists/memberships
list_memberships = get_lists_memberships("randyzwitch")

#Get saved searches list
#https://dev.twitter.com/docs/api/1.1/get/saved_searches/list
saved_searches = get_saved_searches_list()


