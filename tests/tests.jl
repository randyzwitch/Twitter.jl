#Authentication using consumer & oauth values
twitterauth("6nOtpXmf...", 
            "sES5Zlj096S...",
            "98689850-Hj...",
            "UroqCVpWKIt...")

############################################## timelines.jl ##############################################

#Get mentions (@ replies to authenticated account), defaults to last 20
mentions_default20 = get_mentions_timeline();
DataFrame(mentions_default20) #Convert Array{TWEETS,1} to DataFrame

#Get tweets from any public user timeline, defaults to last 20
user_timeline_default20 = get_user_timeline(; options = {"screen_name" => "randyzwitch"})

#Get tweets from authenticated user's timeline, defaults to 20
home_timeline_default20 = get_home_timeline();

#Get most recent re-tweets from authenticated user, defaults to 20
retweets_default20 = get_retweets_of_me()

############################################## tweets.jl ##########################################

#Get retweets by id number of tweet
get_retweets_by_id = get_retweets_id("434685122671939584")

#Get single tweet by id number
get_tweet_by_id = get_single_tweet_id("434685122671939584") 

#Remove a tweet by a specific id
remove_tweet = post_destroy_single_tweet_id("439427946487742465")

#Post a status update to Twitter 
status_update = post_status_update("I can't believe it snowed today, then is now 45 degrees and all the snow is gone. Strange times.")

#Retweet someone based on id
retweet = post_status_retweet_id("439428476106702848")

#post_status_update_media

#Get embedded tweet code: either "id" or "url" required by API, passed in through options Dict in Julia
get_embedded_tweet_code = get_oembed(options = {"id" => "434685122671939584"})

#Get ids for people who retweeted a given status
retweeters_ids = get_retweeters_id("431782228826550272")

############################################## search.jl ##########################################

#Return tweets matching search term
duke_tweets = get_search_tweets("#Duke")

############################################## streaming.jl #######################################

#post_streaming_filtered

#get_streaming_sample

#get_firehose

#get_user_streaming

#get_site_streaming

############################################## dm.jl ##############################################

#Get direct messages received
dm_received = get_direct_messages()

#Get direct messages sent
dm_sent = get_direct_messages_sent()

#Get single direct message received
get_single_dm = get_direct_messages_show("435234003939905536")

#Delete a received DM
destroy = post_direct_messages_destroy("438517039385178113")

#Send DM to a user
send_dm = post_direct_messages_send("Testing from Julia, this might disappear later"; options = {"screen_name" => "jowanza"})

############################################## friendsfollowers.jl ################################

#Get ids of friends that you don't want to see retweets from
friends_but_dont_see_rts = get_friendships_no_retweets()

#Get numeric ids of all friends
get_friends = get_friends_ids(options = {"screen_name" => "randyzwitch"})

#Get numeric ids of followers
get_followers = get_followers_ids()

#Get authenticated user relationship to other users
friendship_status = get_friendships_lookup(options = {"screen_name" => "usujason, hilamonster, kyrieirving"})

#Get list of pending requests to authenticated user
pending_friendships_incoming = get_friendships_incoming()

#Get list of pending requests by authenticated user outstanding
pending_friendships_outgoing = get_friendships_outgoing()

#Follow a user
add_friend = post_friendships_create(options = {"screen_name" => "kyrieirving"})

#Unfollow a user
unfollow = post_friendships_destroy(options = {"screen_name" => "kyrieirving"})

#Enable/disable retweets and device updates from specified user
friend_update = post_friendships_update(options = {"screen_name" => "jowanza", "retweets" => "true", "device" => "false"})

#Get friendship details between any two arbitrary users
detailed_info_two_users = get_friendships_show(options = {"source_screen_name" => "randyzwitch", "target_screen_name" => "usujason"})

#Get friendship list as names
friends_names = get_friends_list(options = {"screen_name" => "randyzwitch"})

#Get followers names
followers_names = get_followers_list(options = {"screen_name" => "randyzwitch"})

############################################## users.jl ###########################################

#Get settings for authenticated account
settings = get_account_settings();

#Verify credentials
verify_cred = get_verify_credentials()

#Change account settings
change_settings = post_account_settings(options = {"lang" => "en", "sleep_time_enabled" => "false"})

#Allow for SMS or regular notifications from Twitter
update_delivery = post_update_delivery_device("sms")

#Update profile information
update_profile = post_update_profile(options = {"name" => "Julia Twitter User"})

#Update picture background
update_background = post_update_profile_background(options = {"tile" => "true"})

#Update profile colors
update_colors = post_update_profile_colors(options = {"profile_background_color" => "3D3D3D", "profile_link_color" => "0000FF"})

#Update profile image
update_image = post_update_profile_image(options = {"image" => "ABCDEFGH..."})

#Get list of users authenticated user is blocking
blocked_users = get_blocks_list()

#Get list of ids blocked by authenticated user
blocked_ids = get_blocks_ids()

#Block a user
block_a_user = post_blocks_create(options = {"screen_name" => "BandonDunesGolf"})

#Unblock a user
unblock_a_user = post_blocks_destroy(options = {"screen_name" => "BandonDunesGolf"})

#Get information about specific users
multiple_user_info = get_users_lookup(options = {"screen_name" => "kyrieirving, jpiz1"})

#Get information about a single user
single_user_info = get_users_show(options = {"screen_name" => "amilejefferson"})

#Search for users based on a topic
search_for_users = get_users_search("data science")

#Get users that authenticate user account can contribute to 
contributees = get_users_contributees(options = {"screen_name" => "randyzwitch"})

#Get users that can contribute to the authenticated account
contributors = get_users_contributors(options = {"screen_name" => "randyzwitch"})

#Remove profile banner
remove_banner = post_account_remove_profile_banner()

#post_account_update_profile_banner
add_banner = post_account_update_profile_banner("base64_banner_data"; options = {"width" => "1040", "height" => "520"})

#Get profile banner
profile_banner = get_profile_banner(options = {"screen_name" => "randyzwitch"})

############################################## suggestedusers.jl ##################################

#Get user suggestions for a given category of suggested users
user_suggestions_twitter_slug = get_user_suggestions_slug("twitter")

#Get suggested user categories
suggested_categories = get_user_suggestions()

#Get users in suggested user group
members_suggested_category = get_user_suggestions_slug_members("sochi")

############################################## favorites.jl #######################################

#Get favorites list for authenticated user (when no arguments are specified)
favorites_auth_user = get_favorites_list()

#Unfavorite a tweet
unfavorite_tweet = post_favorites_destroy("439089844468588544")

#Favorite a tweet
favorite_tweet = post_favorites_create("439801028910010369")

############################################## lists.jl ###########################################

#Get lists - by default, no argument means lists subscribed to by authenticated user
lists_subscribed_to = get_lists()

#Get tweets for a given list id
tweets_given_list = get_lists_statuses(options = {"list_id" => "4300970"})

#Remove a member from a list
remove_user = post_lists_members_destroy(options = {"owner_screen_name" => "randyzwitch", "slug" => "julia-users", "screen_name" => "viralbshah"}) 

#Get lists which user has been added to
list_adds = get_lists_memberships(options = {"screen_name" => "randyzwitch"})

#Get subscribers of a certain list id
list_subscribers = get_lists_subscribers(options = {"list_id" => "4300970"})

#Subscribe authenticated user to list
subscribe_list = post_lists_subscribers_create(options = {"list_id" => "4300970"})

#Check if user is subscribed to a list
check_user_subscriber = get_lists_subscribers_show(options = {"list_id" => "4300970", "screen_name" => "randyzwitch"})

#Unsubscribe authenticated user from list
unsub_list = post_lists_subscribers_destroy(options = {"owner_screen_name" => "nduley", "slug" => "omniture-webanalytics"})

#Add multiple users to list; no spaces allowed in list of screen_names
multiple_create = post_lists_members_createall(options = {"owner_screen_name" => "randyzwitch", "slug" => "julia-users", "screen_name" => "stefankarpinski,viral_b_shah,jowanza"}) 

#Check if a member is a member of a specific list
mem_show = get_lists_members_show(options = {"owner_screen_name" => "randyzwitch", "slug" => "julia-users", "screen_name" => "johnmyleswhite"})

#Get members of a list
list_members = get_lists_members(options = {"list_id" => "4300970"})

#Add single user to list
add_one_user = post_lists_members_create(options = {"owner_screen_name" => "randyzwitch", "slug" => "julia-users", "screen_name" => "johnmyleswhite"}) 

#Delete a list
destroy = post_lists_destroy(options = {"owner_screen_name" => "randyzwitch", "slug" => "julia-folks"})

#Update characteristics of a list
update_list = post_lists_update(options = {"list_id" => "106887912", "name" => "julia folks"})

#Create a new list owned by authenticated user
create_list = post_lists_create("julia users")

#Get specified list
get_list = get_lists_show(options = {"list_id" => "4300970"})

#Get lists a user is subscribed to
get_list_subs = get_lists_subscriptions(options = {"screen_name" => "randyzwitch"})

#Remove multiple members from a list
remove_multiple = post_lists_members_destroyall(options = {"owner_screen_name" => "randyzwitch", "slug" => "julia-users", "screen_name" => "johnmyleswhite,jowanza"})

#Get lists user owns
owned_lists = get_lists_ownerships(options = {"screen_name" => "nduley"})

############################################## savedsearches.jl ###################################

#Get saved searches for authenticated user
saved_searches = get_saved_searches_list()

#Get info about saved search by id
saved_search_info = get_saved_searches_show_id("23777812")

#Create a saved search
create_saved_search = post_saved_searches_create("#julialang")

#Remove a saved search by id
remove_saved_search = post_saved_searches_destroy_id("315945769")

############################################## geo.jl #############################################

#Get information about a specific place
geo_info = get_geo_id_place_id("df51dec6f4ee2b2c")

#Get places that can be used for a place_id from a set of lat/long coordinates
place_ids = get_geo_reverse_geocode("37.7821120598956", "-122.400612831116")

#Search for place_ids based on information that you know (IP, lat/long, etc.)
search_for_places = get_geo_search(options = {"ip" => "74.125.19.104"})

#Get places near a given location
similar_places = get_geo_similar_places("37.7821120598956", "-122.400612831116", "Twitter HQ")

############################################## trends.jl ##########################################

#Get trends based on a certain WOEID
trends_place1 = get_trends_place("1")

#Get locations where Twitter has trend data
trend_locations = get_trends_available()

#Get trends closest to a specified location
close_trends = get_trends_closest("37.781157", "-122.400612831116")

############################################## spam.jl ############################################

#Report a user as a spammer (also blocks user for authenticated user)
report_spammer = post_users_report_spam(options = {"screen_name" => "TEAMF0LL0W"})

############################################## oauth.jl ###########################################

#get_oauth_authenticate

#get_oauth_authorize

#post_oauth_access_token

#post_oauth_request_token

#post_oauth2_token

#post_oauth2_invalidate_token

############################################## help.jl ############################################

#Get configuration for authenticated user
user_configuration = get_help_configuration()

#Get languages/codes that Twitter supports
languages = get_help_languages()

#Get privacy policy
privacy_policy = get_help_privacy()

#Get terms of service
terms_of_service = get_help_tos()

#Get application rate limits
rate_limits = get_application_rate_limit_status()


