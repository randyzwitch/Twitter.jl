#############################################################
#
# Parse responses into Julia types
#
#############################################################

function to_TWEETS(object::Dict)

    return   TWEETS(get(object, "contributors", nothing),                   #    contributors
                    get(object, "coordinates", nothing),                    #    coordinates
                    get(object, "created_at", nothing),                     #    created_at
                    get(object, "current_user_retweet", nothing),           #    current_user_retweet
                    get(object, "entities", nothing),                       #    entities
                    get(object, "favorite_count", nothing),                 #    favorite_count
                    get(object, "favorited", nothing),                      #    favorited
                    get(object, "filter_level", nothing),                   #    filter_level
                    get(object, "id", nothing),                             #    id
                    get(object, "id_str", nothing),                         #    id_str 
                    get(object, "in_reply_to_screen_name", nothing),        #    in_reply_to_screen_name
                    get(object, "in_reply_to_status_id", nothing),          #    in_reply_to_status_id
                    get(object, "in_reply_to_status_id_str", nothing),      #    in_reply_to_status_id_str
                    get(object, "in_reply_to_user_id", nothing),            #    in_reply_to_status_id
                    get(object, "in_reply_to_user_id_str", nothing),        #    in_reply_to_user_id_str
                    get(object, "lang", nothing),                           #    lang 
                    get(object, "place", nothing),                          #    place 
                    get(object, "possibly_sensitive", nothing),             #    possibly_sensitive
                    get(object, "scopes", nothing),                         #    scopes
                    get(object, "retweet_count", nothing),                  #    retweet_count
                    get(object, "retweeted", nothing),                      #    retweeted
                    get(object, "retweeted_status", nothing),               #    retweeted_status
                    get(object, "source", nothing),                         #    source
                    get(object, "text", nothing),                           #    text
                    get(object, "truncated", nothing),                      #    truncated
                    get(object, "user", nothing),                           #    user 
                    get(object, "withheld_copyright", nothing),             #    withheld_copyright
                    get(object, "withheld_in_countries", nothing),          #    withheld_in_countries
                    get(object, "withheld_scope", nothing)                  #    withheld_scope
                    )

end

#Vectorize function manually for better output control
function to_TWEETS(object::Array)

     return TWEETS[to_TWEETS(tweet) for tweet in object]

end

function to_USERS(object::Dict)
    
    return USERS(   get(object, "contributors_enabled", nothing),                     #  contributors_enabled
                    get(object, "created_at", nothing),                               #  created_at
                    get(object, "default_profile", nothing),                          #  default_profile
                    get(object, "default_profile_image", nothing),                    #  default_profile_image
                    get(object, "description", nothing),                              #  description
                    get(object, "entities", nothing),                                 #  entities
                    get(object, "favourites_count", nothing),                         #  favourites_count
                    get(object, "follow_request_sent", nothing),                      #  follow_request_sent
                    get(object, "followers_count", nothing),                          #  followers_count
                    get(object, "friends_count", nothing),                            #  friends_count
                    get(object, "geo_enabled", nothing),                              #  geo_enabled
                    get(object, "id", nothing),                                       #  id
                    get(object, "id_str", nothing),                                   #  id_str
                    get(object, "is_translator", nothing),                            #  is_translator
                    get(object, "listed_count", nothing),                             #  listed_count
                    get(object, "location", nothing),                                 #  location
                    get(object, "name", nothing),                                     #  name
                    get(object, "profile_background_color", nothing),                 #  profile_background_color
                    get(object, "profile_background_image_url", nothing),             #  profile_background_image_url
                    get(object, "profile_background_image_url_https", nothing),       #  profile_background_image_url_https
                    get(object, "profile_backround_tile", nothing),                   #  profile_backround_tile
                    get(object, "profile_banner_url", nothing),                       #  profile_banner_url
                    get(object, "profile_image_url", nothing),                        #  profile_image_url
                    get(object, "profile_image_url_https", nothing),                  #  profile_image_url_https 
                    get(object, "profile_link_color", nothing),                       #  profile_link_color
                    get(object, "profile_sidebar_border_color", nothing),             #  profile_sidebar_border_color
                    get(object, "profile_sidebar_fill_color", nothing),               #  profile_sidebar_fill_color
                    get(object, "profile_text_color", nothing),                       #  profile_text_color
                    get(object, "profile_use_background_image", nothing),             #  profile_use_background_image
                    get(object, "protected", nothing),                                #  protected
                    get(object, "screen_name", nothing),                              #  screen_name
                    get(object, "show_all_inline_media", nothing),                    #  show_all_inline_media
                    get(object, "status", nothing),                                   #  status
                    get(object, "statuses_count", nothing),                           #  statuses_count
                    get(object, "time_zone", nothing),                                #  time_zone
                    get(object, "url", nothing),                                      #  url
                    get(object, "utc_offset", nothing),                               #  utc_offset
                    get(object, "verified", nothing),                                 #  verified
                    get(object, "withheld_in_countries", nothing),                    #  withheld_in_countries
                    get(object, "withheld_scope", nothing)                            #  withheld_scope
                )

end

#Vectorize function manually for better output control
function to_USERS(object::Array)

     return USERS[to_USERS(tweet) for tweet in object]

end

function to_PLACES(object::Dict)

    return PLACES(  get(object, "attributes", nothing),          #attributes
                    get(object, "bounding_box", nothing),        #bounding_box
                    get(object, "country", nothing),             #country
                    get(object, "country_code", nothing),        #country_code
                    get(object, "full_name", nothing),           #full_name
                    get(object, "id", nothing),                  #id
                    get(object, "name", nothing),                #name 
                    get(object, "place_type", nothing),          #place_type
                    get(object, "url", nothing)                  #url  
                )

end

#Vectorize function manually for better output control
function to_PLACES(object::Array)

     return PLACES[to_PLACES(tweet) for tweet in object]

end

function to_LISTS(object::Dict)

     return LISTS( get(object, "created_at", nothing),                     #created_at
                   get(object, "description", nothing),                    #description
                   get(object, "following", nothing),                      #following
                   get(object, "full_name", nothing),                      #full_name    
                   get(object, "id", nothing),                             #id 
                   get(object, "id_str", nothing),                         #id_str
                   get(object, "member_count", nothing),                   #member_count
                   get(object, "mode", nothing),                           #mode
                   get(object, "name", nothing),                           #name
                   get(object, "slug", nothing),                           #slug
                   get(object, "subscriber_count", nothing),               #subscriber_count
                   get(object, "uri", nothing),                            #uri             
                   get(object, "user", nothing)                            #user            
                 )

end

#Vectorize function manually for better output control
function to_LISTS(object::Array)

     return LISTS[to_LISTS(tweet) for tweet in object]

end