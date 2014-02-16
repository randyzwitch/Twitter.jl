#WIP: Doesn't cover all scenarios
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
            return json #Return a Dict
    end
end