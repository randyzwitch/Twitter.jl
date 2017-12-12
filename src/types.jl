abstract type TwitterType end

#Type to hold Twitter API credentials
mutable struct TWCredential <: TwitterType
    consumer_key::String
    consumer_secret::String
    oauth_token::String
    oauth_secret::String
end

#Places response object
mutable struct Places <: TwitterType
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
mutable struct Users <: TwitterType
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
mutable struct Tweets <: TwitterType
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
mutable struct Lists <: TwitterType
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

#Methods to convert JSON/Dict to Twitter types
Tweets(object::Dict) =
    Tweets(get(object, "contributors", nothing),
            get(object, "coordinates", nothing),
            get(object, "created_at", nothing),
            get(object, "current_user_retweet", nothing),
            get(object, "entities", nothing),
            get(object, "favorite_count", nothing),
            get(object, "favorited", nothing),
            get(object, "filter_level", nothing),
            get(object, "full_text", nothing),
            get(object, "id", nothing),
            get(object, "id_str", nothing),
            get(object, "in_reply_to_screen_name", nothing),
            get(object, "in_reply_to_status_id", nothing),
            get(object, "in_reply_to_status_id_str", nothing),
            get(object, "in_reply_to_user_id", nothing),
            get(object, "in_reply_to_user_id_str", nothing),
            get(object, "lang", nothing),
            get(object, "place", nothing),
            get(object, "possibly_sensitive", nothing),
            get(object, "scopes", nothing),
            get(object, "retweet_count", nothing),
            get(object, "retweeted", nothing),
            get(object, "retweeted_status", nothing),
            get(object, "source", nothing),
            get(object, "text", nothing),
            get(object, "truncated", nothing),
            get(object, "user", nothing),
            get(object, "withheld_copyright", nothing),
            get(object, "withheld_in_countries", nothing),
            get(object, "withheld_scope", nothing)
            )

Users(object::Dict) =
    Users(get(object, "contributors_enabled", nothing),
            get(object, "created_at", nothing),
            get(object, "default_profile", nothing),
            get(object, "default_profile_image", nothing),
            get(object, "description", nothing),
            get(object, "entities", nothing),
            get(object, "favourites_count", nothing),
            get(object, "follow_request_sent", nothing),
            get(object, "followers_count", nothing),
            get(object, "friends_count", nothing),
            get(object, "geo_enabled", nothing),
            get(object, "id", nothing),
            get(object, "id_str", nothing),
            get(object, "is_translator", nothing),
            get(object, "listed_count", nothing),
            get(object, "location", nothing),
            get(object, "name", nothing),
            get(object, "profile_background_color", nothing),
            get(object, "profile_background_image_url", nothing),
            get(object, "profile_background_image_url_https", nothing),
            get(object, "profile_backround_tile", nothing),
            get(object, "profile_banner_url", nothing),
            get(object, "profile_image_url", nothing),
            get(object, "profile_image_url_https", nothing),
            get(object, "profile_link_color", nothing),
            get(object, "profile_sidebar_border_color", nothing),
            get(object, "profile_sidebar_fill_color", nothing),
            get(object, "profile_text_color", nothing),
            get(object, "profile_use_background_image", nothing),
            get(object, "protected", nothing),
            get(object, "screen_name", nothing),
            get(object, "show_all_inline_media", nothing),
            get(object, "status", nothing),
            get(object, "statuses_count", nothing),
            get(object, "time_zone", nothing),
            get(object, "url", nothing),
            get(object, "utc_offset", nothing),
            get(object, "verified", nothing),
            get(object, "withheld_in_countries", nothing),
            get(object, "withheld_scope", nothing)
            )

Places(object::Dict) =
    Places(get(object, "attributes", nothing),
            get(object, "bounding_box", nothing),
            get(object, "country", nothing),
            get(object, "country_code", nothing),
            get(object, "full_name", nothing),
            get(object, "id", nothing),
            get(object, "name", nothing),
            get(object, "place_type", nothing),
            get(object, "url", nothing)
            )

Lists(object::Dict) =
    Lists(get(object, "created_at", nothing),
            get(object, "description", nothing),
            get(object, "following", nothing),
            get(object, "full_name", nothing),
            get(object, "id", nothing),
            get(object, "id_str", nothing),
            get(object, "member_count", nothing),
            get(object, "mode", nothing),
            get(object, "name", nothing),
            get(object, "slug", nothing),
            get(object, "subscriber_count", nothing),
            get(object, "uri", nothing),
            get(object, "user", nothing)
            )
