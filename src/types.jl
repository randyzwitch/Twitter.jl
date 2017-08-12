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
    attributes::Union{Dict, Void}
    bounding_box::Union{Dict, Void}
    country::Union{AbstractString, Void}
    country_code::Union{AbstractString, Void}
    full_name::Union{AbstractString, Void}
    id::Union{AbstractString, Void}
    name::Union{AbstractString, Void}
    place_type::Union{AbstractString, Void}
    url::Union{AbstractString, Void}
end

#Users response object
type USERS
    contributors_enabled::Union{Bool, Void}
    created_at::Union{AbstractString, Void}
    default_profile::Union{Bool, Void}
    default_profile_image::Union{Bool, Void}
    description::Union{AbstractString, Void}
    entities::Union{Dict, Void}
    favourites_count::Union{Int, Void}
    follow_request_sent::Union{Bool, Void}
    followers_count::Union{Int, Void}
    friends_count::Union{Int, Void}
    geo_enabled::Union{Bool, Void}
    id::Union{Int, Void}
    id_str::Union{AbstractString, Void}
    is_translator::Union{Bool, Void}
    listed_count::Union{Int, Void}
    location::Union{AbstractString, Void}
    name::Union{AbstractString, Void}
    profile_background_color::Union{AbstractString, Void}
    profile_background_image_url::Union{AbstractString, Void}
    profile_background_image_url_https::Union{AbstractString, Void}
    profile_backround_tile::Union{Bool, Void}
    profile_banner_url::Union{AbstractString, Void}
    profile_image_url::Union{AbstractString, Void}
    profile_image_url_https::Union{AbstractString, Void}
    profile_link_color::Union{AbstractString, Void}
    profile_sidebar_border_color::Union{AbstractString, Void}
    profile_sidebar_fill_color::Union{AbstractString, Void}
    profile_text_color::Union{AbstractString, Void}
    profile_use_background_image::Union{Bool, Void}
    protected::Union{Bool, Void}
    screen_name::Union{AbstractString, Void}
    show_all_inline_media::Union{Bool, Void}
    status::Union{Dict, Void}
    statuses_count::Union{Int, Void}
    time_zone::Union{AbstractString, Void}
    url::Union{AbstractString, Void}
    utc_offset::Union{Int, Void}
    verified::Union{Bool, Void}
    withheld_in_countries::Union{AbstractString, Void}
    withheld_scope::Union{AbstractString, Void}
end

#Tweets response object
type TWEETS
    contributors::Union{Dict, Void}
    coordinates::Union{Dict, Void}
    created_at::Union{AbstractString, Void}
    current_user_retweet::Union{Dict, Void}
    entities::Union{Dict, Void}
    favorite_count::Union{Int, Void}
    favorited::Union{Bool, Void}
    filter_level::Union{AbstractString, Void}
    full_text::Union{AbstractString, Void}
    id::Union{Int, Void}
    id_str::Union{AbstractString, Void}
    in_reply_to_screen_name::Union{AbstractString, Void}
    in_reply_to_status_id::Union{Int, Void}
    in_reply_to_status_id_str::Union{AbstractString, Void}
    in_reply_to_user_id::Union{Int, Void}
    in_reply_to_user_id_str::Union{AbstractString, Void}
    lang::Union{AbstractString, Void}
    place::Union{Dict, Void}
    possibly_sensitive::Union{Bool, Void}
    scopes::Union{Dict, Void}
    retweet_count::Union{Int, Void}
    retweeted::Union{Bool, Void}
    retweeted_status::Union{Dict, Void}
    source::Union{AbstractString, Void}
    text::Union{AbstractString, Void}
    truncated::Union{Bool, Void}
    user::Union{Dict, Void}
    withheld_copyright::Union{Bool, Void}
    withheld_in_countries::Union{Array, Void}
    withheld_scope::Union{AbstractString, Void}
end

#Lists response object
type LISTS
    created_at::Union{AbstractString, Void}
    description::Union{AbstractString, Void}
    following::Union{Bool, Void}
    full_name::Union{AbstractString, Void}
    id::Union{Int, Void}
    id_str::Union{AbstractString, Void}
    member_count::Union{Int, Void}
    mode::Union{AbstractString, Void}
    name::Union{AbstractString, Void}
    slug::Union{AbstractString, Void}
    subscriber_count::Union{Int, Void}
    uri::Union{AbstractString, Void}
    user::Union{Dict, Void}
end
