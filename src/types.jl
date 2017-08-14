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
    attributes::Union{Dict, Void}
    bounding_box::Union{Dict, Void}
    country::Union{String, Void}
    country_code::Union{String, Void}
    full_name::Union{String, Void}
    id::Union{String, Void}
    name::Union{String, Void}
    place_type::Union{String, Void}
    url::Union{String, Void}
end

#Users response object
type USERS
    contributors_enabled::Union{Bool, Void}
    created_at::Union{String, Void}
    default_profile::Union{Bool, Void}
    default_profile_image::Union{Bool, Void}
    description::Union{String, Void}
    entities::Union{Dict, Void}
    favourites_count::Union{Int, Void}
    follow_request_sent::Union{Bool, Void}
    followers_count::Union{Int, Void}
    friends_count::Union{Int, Void}
    geo_enabled::Union{Bool, Void}
    id::Union{Int, Void}
    id_str::Union{String, Void}
    is_translator::Union{Bool, Void}
    listed_count::Union{Int, Void}
    location::Union{String, Void}
    name::Union{String, Void}
    profile_background_color::Union{String, Void}
    profile_background_image_url::Union{String, Void}
    profile_background_image_url_https::Union{String, Void}
    profile_backround_tile::Union{Bool, Void}
    profile_banner_url::Union{String, Void}
    profile_image_url::Union{String, Void}
    profile_image_url_https::Union{String, Void}
    profile_link_color::Union{String, Void}
    profile_sidebar_border_color::Union{String, Void}
    profile_sidebar_fill_color::Union{String, Void}
    profile_text_color::Union{String, Void}
    profile_use_background_image::Union{Bool, Void}
    protected::Union{Bool, Void}
    screen_name::Union{String, Void}
    show_all_inline_media::Union{Bool, Void}
    status::Union{Dict, Void}
    statuses_count::Union{Int, Void}
    time_zone::Union{String, Void}
    url::Union{String, Void}
    utc_offset::Union{Int, Void}
    verified::Union{Bool, Void}
    withheld_in_countries::Union{String, Void}
    withheld_scope::Union{String, Void}
end

#Tweets response object
type TWEETS
    contributors::Union{Dict, Void}
    coordinates::Union{Dict, Void}
    created_at::Union{String, Void}
    current_user_retweet::Union{Dict, Void}
    entities::Union{Dict, Void}
    favorite_count::Union{Int, Void}
    favorited::Union{Bool, Void}
    filter_level::Union{String, Void}
    full_text::Union{String, Void}
    id::Union{Int, Void}
    id_str::Union{String, Void}
    in_reply_to_screen_name::Union{String, Void}
    in_reply_to_status_id::Union{Int, Void}
    in_reply_to_status_id_str::Union{String, Void}
    in_reply_to_user_id::Union{Int, Void}
    in_reply_to_user_id_str::Union{String, Void}
    lang::Union{String, Void}
    place::Union{Dict, Void}
    possibly_sensitive::Union{Bool, Void}
    scopes::Union{Dict, Void}
    retweet_count::Union{Int, Void}
    retweeted::Union{Bool, Void}
    retweeted_status::Union{Dict, Void}
    source::Union{String, Void}
    text::Union{String, Void}
    truncated::Union{Bool, Void}
    user::Union{Dict, Void}
    withheld_copyright::Union{Bool, Void}
    withheld_in_countries::Union{Array, Void}
    withheld_scope::Union{String, Void}
end

#Lists response object
type LISTS
    created_at::Union{String, Void}
    description::Union{String, Void}
    following::Union{Bool, Void}
    full_name::Union{String, Void}
    id::Union{Int, Void}
    id_str::Union{String, Void}
    member_count::Union{Int, Void}
    mode::Union{String, Void}
    name::Union{String, Void}
    slug::Union{String, Void}
    subscriber_count::Union{Int, Void}
    uri::Union{String, Void}
    user::Union{Dict, Void}
end
