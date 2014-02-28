#############################################################
#
# Custom Types
#
#############################################################

#Type to hold Twitter API credentials
type TWCRED
    consumer_key::String
    consumer_secret::String
    oauth_token::String
    oauth_secret::String
end

#Places response object
type PLACES
    attributes::Union(Dict, Nothing)
    bounding_box::Union(Dict, Nothing)
    country::Union(String, Nothing)
    country_code::Union(String, Nothing)
    full_name::Union(String, Nothing)
    id::Union(String, Nothing)
    name::Union(String, Nothing)
    place_type::Union(String, Nothing)
    url::Union(String, Nothing)
end

#Users response object
type USERS 
    contributors_enabled::Union(Bool, Nothing)
    created_at::Union(String, Nothing)
    default_profile::Union(Bool, Nothing)
    default_profile_image::Union(Bool, Nothing)
    description::Union(UTF8String, Nothing)
    entities::Union(Dict, Nothing)
    favourites_count::Union(Int, Nothing)
    follow_request_sent::Union(Bool, Nothing)
    followers_count::Union(Int, Nothing)
    friends_count::Union(Int, Nothing)
    geo_enabled::Union(Bool, Nothing)
    id::Union(Int, Nothing)
    id_str::Union(String, Nothing)
    is_translator::Union(Bool, Nothing)
    listed_count::Union(Int, Nothing)
    location::Union(String, Nothing)
    name::Union(String, Nothing)
    profile_background_color::Union(String, Nothing)
    profile_background_image_url::Union(String, Nothing)
    profile_background_image_url_https::Union(String, Nothing)
    profile_backround_tile::Union(Bool, Nothing)
    profile_banner_url::Union(String, Nothing)
    profile_image_url::Union(String, Nothing)
    profile_image_url_https::Union(String, Nothing) 
    profile_link_color::Union(String, Nothing)
    profile_sidebar_border_color::Union(String, Nothing)
    profile_sidebar_fill_color::Union(String, Nothing)
    profile_text_color::Union(String, Nothing)
    profile_use_background_image::Union(Bool, Nothing)
    protected::Union(Bool, Nothing)
    screen_name::Union(String, Nothing)
    show_all_inline_media::Union(Bool, Nothing)
    status::Union(Dict, Nothing)
    statuses_count::Union(Int, Nothing)
    time_zone::Union(String, Nothing)
    url::Union(String, Nothing)
    utc_offset::Union(Int, Nothing)
    verified::Union(Bool, Nothing)
    withheld_in_countries::Union(String, Nothing)
    withheld_scope::Union(String, Nothing)
end

#Tweets response object
type TWEETS
    contributors::Union(Dict, Nothing)
    coordinates::Union(Dict, Nothing)
    created_at::Union(String, Nothing)
    current_user_retweet::Union(Dict, Nothing)
    entities::Union(Dict, Nothing)
    favorite_count::Union(Int, Nothing)
    favorited::Union(Bool, Nothing)
    filter_level::Union(String, Nothing)
    id::Union(Int, Nothing)
    id_str::Union(String, Nothing)
    in_reply_to_screen_name::Union(String, Nothing)
    in_reply_to_status_id::Union(Int, Nothing)
    in_reply_to_status_id_str::Union(String, Nothing)
    in_reply_to_user_id::Union(Int, Nothing)
    in_reply_to_user_id_str::Union(String, Nothing)
    lang::Union(String, Nothing) 
    place::Union(Dict, Nothing)
    possibly_sensitive::Union(Bool, Nothing)
    scopes::Union(Dict, Nothing)
    retweet_count::Union(Int, Nothing)
    retweeted::Union(Bool, Nothing)
    retweeted_status::Union(Dict, Nothing)
    source::Union(String, Nothing)
    text::Union(String, Nothing)
    truncated::Union(Bool, Nothing)
    user::Union(Dict, Nothing)
    withheld_copyright::Union(Bool, Nothing)
    withheld_in_countries::Union(Array, Nothing)
    withheld_scope::Union(String, Nothing)
end

#Lists response object
type LISTS
    created_at::Union(String, Nothing)
    description::Union(String, Nothing)
    following::Union(Bool, Nothing)
    full_name::Union(String, Nothing)   
    id::Union(Int, Nothing) 
    id_str::Union(String, Nothing)
    member_count::Union(Int, Nothing)
    mode::Union(String, Nothing)
    name::Union(String, Nothing)
    slug::Union(String, Nothing)
    subscriber_count::Union(Int, Nothing)
    uri::Union(String, Nothing)             
    user::Union(Dict, Nothing)            
end