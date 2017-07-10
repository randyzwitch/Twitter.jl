#############################################################
#
# Custom Types
#
#############################################################

#Type to hold Twitter API credentials
type TWCRED
    consumer_key::AbstractString
    consumer_secret::AbstractString
    oauth_token::AbstractString
    oauth_secret::AbstractString
end

#Places response object
type PLACES
    attributes::@compat(Union{Dict, Void})
    bounding_box::@compat(Union{Dict, Void})
    country::@compat(Union{AbstractString, Void})
    country_code::@compat(Union{AbstractString, Void})
    full_name::@compat(Union{AbstractString, Void})
    id::@compat(Union{AbstractString, Void})
    name::@compat(Union{AbstractString, Void})
    place_type::@compat(Union{AbstractString, Void})
    url::@compat(Union{AbstractString, Void})
end

#Users response object
type USERS
    contributors_enabled::@compat(Union{Bool, Void})
    created_at::@compat(Union{AbstractString, Void})
    default_profile::@compat(Union{Bool, Void})
    default_profile_image::@compat(Union{Bool, Void})
    description::@compat(Union{AbstractString, Void})
    entities::@compat(Union{Dict, Void})
    favourites_count::@compat(Union{Int, Void})
    follow_request_sent::@compat(Union{Bool, Void})
    followers_count::@compat(Union{Int, Void})
    friends_count::@compat(Union{Int, Void})
    geo_enabled::@compat(Union{Bool, Void})
    id::@compat(Union{Int, Void})
    id_str::@compat(Union{AbstractString, Void})
    is_translator::@compat(Union{Bool, Void})
    listed_count::@compat(Union{Int, Void})
    location::@compat(Union{AbstractString, Void})
    name::@compat(Union{AbstractString, Void})
    profile_background_color::@compat(Union{AbstractString, Void})
    profile_background_image_url::@compat(Union{AbstractString, Void})
    profile_background_image_url_https::@compat(Union{AbstractString, Void})
    profile_backround_tile::@compat(Union{Bool, Void})
    profile_banner_url::@compat(Union{AbstractString, Void})
    profile_image_url::@compat(Union{AbstractString, Void})
    profile_image_url_https::@compat(Union{AbstractString, Void})
    profile_link_color::@compat(Union{AbstractString, Void})
    profile_sidebar_border_color::@compat(Union{AbstractString, Void})
    profile_sidebar_fill_color::@compat(Union{AbstractString, Void})
    profile_text_color::@compat(Union{AbstractString, Void})
    profile_use_background_image::@compat(Union{Bool, Void})
    protected::@compat(Union{Bool, Void})
    screen_name::@compat(Union{AbstractString, Void})
    show_all_inline_media::@compat(Union{Bool, Void})
    status::@compat(Union{Dict, Void})
    statuses_count::@compat(Union{Int, Void})
    time_zone::@compat(Union{AbstractString, Void})
    url::@compat(Union{AbstractString, Void})
    utc_offset::@compat(Union{Int, Void})
    verified::@compat(Union{Bool, Void})
    withheld_in_countries::@compat(Union{AbstractString, Void})
    withheld_scope::@compat(Union{AbstractString, Void})
end

#Tweets response object
type TWEETS
    contributors::@compat(Union{Dict, Void})
    coordinates::@compat(Union{Dict, Void})
    created_at::@compat(Union{AbstractString, Void})
    current_user_retweet::@compat(Union{Dict, Void})
    entities::@compat(Union{Dict, Void})
    favorite_count::@compat(Union{Int, Void})
    favorited::@compat(Union{Bool, Void})
    filter_level::@compat(Union{AbstractString, Void})
    full_text::@compat(Union{AbstractString, Void})
    id::@compat(Union{Int, Void})
    id_str::@compat(Union{AbstractString, Void})
    in_reply_to_screen_name::@compat(Union{AbstractString, Void})
    in_reply_to_status_id::@compat(Union{Int, Void})
    in_reply_to_status_id_str::@compat(Union{AbstractString, Void})
    in_reply_to_user_id::@compat(Union{Int, Void})
    in_reply_to_user_id_str::@compat(Union{AbstractString, Void})
    lang::@compat(Union{AbstractString, Void})
    place::@compat(Union{Dict, Void})
    possibly_sensitive::@compat(Union{Bool, Void})
    scopes::@compat(Union{Dict, Void})
    retweet_count::@compat(Union{Int, Void})
    retweeted::@compat(Union{Bool, Void})
    retweeted_status::@compat(Union{Dict, Void})
    source::@compat(Union{AbstractString, Void})
    text::@compat(Union{AbstractString, Void})
    truncated::@compat(Union{Bool, Void})
    user::@compat(Union{Dict, Void})
    withheld_copyright::@compat(Union{Bool, Void})
    withheld_in_countries::@compat(Union{Array, Void})
    withheld_scope::@compat(Union{AbstractString, Void})
end

#Lists response object
type LISTS
    created_at::@compat(Union{AbstractString, Void})
    description::@compat(Union{AbstractString, Void})
    following::@compat(Union{Bool, Void})
    full_name::@compat(Union{AbstractString, Void})
    id::@compat(Union{Int, Void})
    id_str::@compat(Union{AbstractString, Void})
    member_count::@compat(Union{Int, Void})
    mode::@compat(Union{AbstractString, Void})
    name::@compat(Union{AbstractString, Void})
    slug::@compat(Union{AbstractString, Void})
    subscriber_count::@compat(Union{Int, Void})
    uri::@compat(Union{AbstractString, Void})
    user::@compat(Union{Dict, Void})
end
