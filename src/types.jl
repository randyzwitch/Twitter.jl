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

#Places response object
type PLACES
    attributes
    bounding_box
    country
    country_code
    full_name
    id
    name 
    place_type
    url
end