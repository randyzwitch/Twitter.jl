module Twitter

#############################################################
#
# Imports & Exports
#
#############################################################

using Codecs, HttpCommon, Requests, JSON, Nettle
import HttpCommon.encodeURI, HttpCommon.Response

#External files by API section
include("dm.jl")
include("favorites.jl")
include("friendsfollowers.jl")
include("geo.jl")
include("help.jl")
include("lists.jl")
include("oauth.jl")
include("savedsearches.jl")
include("search.jl")
include("spam.jl")
include("streaming.jl")
include("suggestedusers.jl")
include("timelines.jl")
include("trends.jl")
include("tweets.jl")
include("users.jl")

export twitterauth, 						#Authentication function
	   twittercred, 						#Authentication object
	   get_user_timeline,					#public API function
	   search_tweets,						#public API function
	   get_friends_ids,						#public API function
	   get_followers_ids,					#public API function
	   get_friends_list,					#public API function
	   get_followers_list,					#public API function
	   get_help_configuration,				#public API function
	   get_help_privacy,					#public API function
	   get_help_tos,						#public API function
	   get_application_rate_limit_status,	#public API function
	   get_help_languages,					#public API function
	   oauthheader, 						#Helper function
	   post_status_update,   				#public API function
	   mentions_timeline,					#public API function
	   home_timeline,						#public API function
	   retweets_of_me,						#public API function
	   get_direct_messages,					#public API function
	   get_direct_messages_sent,			#public API function
	   get_account_settings,				#public API function	
	   validate_credentials,				#public API function	
	   get_blocks_list,						#public API function
	   get_blocks_ids,						#public API function
	   get_users_search,					#public API function
	   get_users_contributees,				#public API function
       get_users_contributors,              #public API function
       get_profile_banner,                  #public API function
       get_user_suggestions_slug,           #public API function
       get_user_suggestions,                #public API function
       get_favorites_list,                  #public API function
       get_lists,                           #public API function
       get_lists_memberships,               #public API function
       get_saved_searches_list,             #public API function
       TWEETS,                              #Custom Type
       TWCRED,                              #Custom Type
       USERS                                #Custom Type

#############################################################
#
# Custom Types
#
#############################################################

#Type to hold Twitter API credentials
type TWCRED
    consumer_key::ASCIIString
    consumer_secret::ASCIIString
    oauth_token::ASCIIString
    oauth_secret::ASCIIString
end

#Tweets response object
type TWEETS
    annotations
    contributors
    coordinates
    created_at
    current_user_retweet
    entities
    favorite_count
    favorited
    filter_level
    geo
    id
    id_str 
    in_reply_to_screen_name
    in_reply_to_status_id
    in_reply_to_status_id_str
    in_reply_to_user_id_str
    lang 
    place 
    possibly_sensitive
    scopes
    retweet_count
    retweeted
    retweeted_status
    source
    text
    truncated
    user 
    withheld_copyright
    withheld_in_countries
    withheld_scope
end

#Users response object
type USERS 
    contributors_enabled
    created_at
    default_profile
    default_profile_image
    description
    entities
    favourites_count
    follow_request_sent
    following
    followers_count
    friends_count
    geo_enabled
    id
    id_str
    is_translator
    listed_count
    location
    name
    notifications
    profile_background_color
    profile_background_image_url
    profile_background_image_url_https
    profile_backround_tile
    profile_banner_url
    profile_image_url
    profile_image_url_https 
    profile_link_color
    profile_sidebar_border_color
    profile_sidebar_fill_color
    profile_text_color
    profile_use_background_image
    protected
    screen_name
    show_all_inline_media
    status
    statuses_count
    time_zone
    url
    utc_offset
    verified
    withheld_in_countries
    withheld_scope
end


#############################################################
#
# General Functions
#
#############################################################

#Extend encodeURI to work on Dicts
function encodeURI(dict_of_parameters::Dict)
    for (k, v) in dict_of_parameters
        dict_of_parameters["$k"] = encodeURI(v)
    end
end

#Function that builds global variable to hold authentication keys
#TODO: Figure out how to do OAuth authentication directly, rather than user putting in credentials directly
function twitterauth(consumer_key::String, consumer_secret::String, oauth_token::String, oauth_secret::String)
    #Create a global variable to hold return from this function
    global twittercred
            
    return twittercred = TWCRED(consumer_key, consumer_secret, oauth_token, oauth_secret)
    
end

#Use this function to build the header for every OAuth call
#This function assumes that options Dict has already been run through encodeURI
function oauthheader(httpmethod::String, baseurl::String, options::Dict)                
    
    #Format non-parameter strings
    baseurl = encodeURI(baseurl)
    httpmethod = encodeURI(uppercase(httpmethod))
    oauth_consumer_secret = encodeURI(twittercred.consumer_secret)
    oauth_token_secret = encodeURI(twittercred.oauth_secret)
    
    #keys for parameter string
    options["oauth_consumer_key"] = encodeURI(twittercred.consumer_key)
    options["oauth_nonce"] = encodeURI(randstring(32)) #32 random alphanumeric characters
    options["oauth_signature_method"] = "HMAC-SHA1"
    options["oauth_timestamp"] = @sprintf("%.0f", time()) #timestamp in seconds
    options["oauth_token"] = encodeURI(twittercred.oauth_token)
    options["oauth_version"] = "1.0"
    
    #Get all available keys, sort them
    optionskeys = collect(keys(options))
    sort!(optionskeys)

    #ordered parameter_string
    #Inspired by Requests.format_query_str
    query_str = ""
    for k in optionskeys
        v = options["$(k)"] #get value for ordered key
        query_str *= "$k=$v&"
    end
    query_str = chop(query_str) # remove the trailing &
    
    parameter_string = encodeURI(query_str) 
    
    #signature_base_string
    signature_base_string = "$(httpmethod)&$(baseurl)&$(parameter_string)"
    
    #Signing key
    signing_key = "$(oauth_consumer_secret)&$(oauth_token_secret)"
    
    #Calculate OAuth signature
    h = HMACState(SHA1, signing_key)
	update!(h, signature_base_string)
	oauth_sig = encodeURI(base64(digest!(h)))
    
    return "OAuth oauth_consumer_key=\"$(options["oauth_consumer_key"])\", oauth_nonce=\"$(options["oauth_nonce"])\", oauth_signature=\"$(oauth_sig)\", oauth_signature_method=\"$(options["oauth_signature_method"])\", oauth_timestamp=\"$(options["oauth_timestamp"])\", oauth_token=\"$(options["oauth_token"])\", oauth_version=\"$(options["oauth_version"])\""
    
end

#Return array of TWEETS object for methods returning Tweets response object
function parse_response(response::Response, response_type::String)
    #Create Array of Dicts from ASCII String
    json = JSON.parse(response.data)
    
    if uppercase(response_type) == "TWEETS"
            return [TWEETS( get(object, "annotations", ""),                 #    annotations
                            get(object, "contributors", ""),                #    contributors
                            get(object, "coordinates", ""),                 #    coordinates
                            get(object, "created_at", ""),                  #    created_at
                            get(object, "current_user_retweet", ""),        #    current_user_retweet
                            get(object, "entities", ""),                    #    entities
                            get(object, "favorite_count", ""),              #    favorite_count
                            get(object, "favorited", ""),                   #    favorited
                            get(object, "filter_level", ""),                #    filter_level
                            get(object, "geo", ""),                         #    geo
                            get(object, "id", ""),                          #    id
                            get(object, "id_str", ""),                      #    id_str 
                            get(object, "in_reply_to_screen_name", ""),     #    in_reply_to_screen_name
                            get(object, "in_reply_to_status_id", ""),       #    in_reply_to_status_id
                            get(object, "in_reply_to_status_id_str", ""),   #    in_reply_to_status_id_str
                            get(object, "in_reply_to_user_id_str", ""),     #    in_reply_to_user_id_str
                            get(object, "lang", ""),                        #    lang 
                            get(object, "place", ""),                       #    place 
                            get(object, "possibly_sensitive", ""),          #    possibly_sensitive
                            get(object, "scopes", ""),                      #    scopes
                            get(object, "retweet_count", ""),               #    retweet_count
                            get(object, "retweeted", ""),                   #    retweeted
                            get(object, "retweeted_status", ""),            #    retweeted_status
                            get(object, "source", ""),                      #    source
                            get(object, "text", ""),                        #    text
                            get(object, "truncated", ""),                   #    truncated
                            get(object, "user", ""),                        #    user 
                            get(object, "withheld_copyright", ""),          #    withheld_copyright
                            get(object, "withheld_in_countries", ""),       #    withheld_in_countries
                            get(object, "withheld_scope", "")               #    withheld_scope
                          ) for object in json]

    elseif uppercase(response_type) == "USERS"
            return [USERS(  get(object, "contributors_enabled", ""),                    #  contributors_enabled
                            get(object, "created_at", ""),                              #  created_at
                            get(object, "default_profile", ""),                         #  default_profile
                            get(object, "default_profile_image", ""),                   #  default_profile_image
                            get(object, "description", ""),                             #  description
                            get(object, "entities", ""),                                #  entities
                            get(object, "favourites_count", ""),                        #  favourites_count
                            get(object, "follow_request_sent", ""),                     #  follow_request_sent
                            get(object, "following", ""),                               #  following
                            get(object, "followers_count", ""),                         #  followers_count
                            get(object, "friends_count", ""),                           #  friends_count
                            get(object, "geo_enabled", ""),                             #  geo_enabled
                            get(object, "id", ""),                                      #  id
                            get(object, "id_str", ""),                                  #  id_str
                            get(object, "is_translator", ""),                           #  is_translator
                            get(object, "listed_count", ""),                            #  listed_count
                            get(object, "location", ""),                                #  location
                            get(object, "name", ""),                                    #  name
                            get(object, "notifications", ""),                           #  notifications
                            get(object, "profile_background_color", ""),                #  profile_background_color
                            get(object, "profile_background_image_url", ""),            #  profile_background_image_url
                            get(object, "profile_background_image_url_https", ""),      #  profile_background_image_url_https
                            get(object, "profile_backround_tile", ""),                  #  profile_backround_tile
                            get(object, "profile_banner_url", ""),                      #  profile_banner_url
                            get(object, "profile_image_url", ""),                       #  profile_image_url
                            get(object, "profile_image_url_https", ""),                 #  profile_image_url_https 
                            get(object, "profile_link_color", ""),                      #  profile_link_color
                            get(object, "profile_sidebar_border_color", ""),            #  profile_sidebar_border_color
                            get(object, "profile_sidebar_fill_color", ""),              #  profile_sidebar_fill_color
                            get(object, "profile_text_color", ""),                      #  profile_text_color
                            get(object, "profile_use_background_image", ""),            #  profile_use_background_image
                            get(object, "protected", ""),                               #  protected
                            get(object, "screen_name", ""),                             #  screen_name
                            get(object, "show_all_inline_media", ""),                   #  show_all_inline_media
                            get(object, "status", ""),                                  #  status
                            get(object, "statuses_count", ""),                          #  statuses_count
                            get(object, "time_zone", ""),                               #  time_zone
                            get(object, "url", ""),                                     #  url
                            get(object, "utc_offset", ""),                              #  utc_offset
                            get(object, "verified", ""),                                #  verified
                            get(object, "withheld_in_countries", ""),                   #  withheld_in_countries
                            get(object, "withheld_scope", ""),                          #  withheld_scope
                         ) for object in json["users"]]
    else
            return response.data
    end
end

end # module
