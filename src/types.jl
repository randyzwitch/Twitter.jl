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
    attributes::Union{Dict, Nothing}
    bounding_box::Union{Dict, Nothing}
    country::Union{String, Nothing}
    country_code::Union{String, Nothing}
    full_name::Union{String, Nothing}
    id::Union{String, Nothing}
    name::Union{String, Nothing}
    place_type::Union{String, Nothing}
    url::Union{String, Nothing}
end

#Users response object
mutable struct Users <: TwitterType
    contributors_enabled::Union{Bool, Nothing}
    created_at::Union{String, Nothing}
    default_profile::Union{Bool, Nothing}
    default_profile_image::Union{Bool, Nothing}
    description::Union{String, Nothing}
    entities::Union{Dict, Nothing}
    favourites_count::Union{Int, Nothing}
    follow_request_sent::Union{Bool, Nothing}
    followers_count::Union{Int, Nothing}
    friends_count::Union{Int, Nothing}
    geo_enabled::Union{Bool, Nothing}
    id::Union{Int64, Nothing}
    id_str::Union{String, Nothing}
    is_translator::Union{Bool, Nothing}
    listed_count::Union{Int, Nothing}
    location::Union{String, Nothing}
    name::Union{String, Nothing}
    profile_background_color::Union{String, Nothing}
    profile_background_image_url::Union{String, Nothing}
    profile_background_image_url_https::Union{String, Nothing}
    profile_backround_tile::Union{Bool, Nothing}
    profile_banner_url::Union{String, Nothing}
    profile_image_url::Union{String, Nothing}
    profile_image_url_https::Union{String, Nothing}
    profile_link_color::Union{String, Nothing}
    profile_sidebar_border_color::Union{String, Nothing}
    profile_sidebar_fill_color::Union{String, Nothing}
    profile_text_color::Union{String, Nothing}
    profile_use_background_image::Union{Bool, Nothing}
    protected::Union{Bool, Nothing}
    screen_name::Union{String, Nothing}
    show_all_inline_media::Union{Bool, Nothing}
    status::Union{Dict, Nothing}
    statuses_count::Union{Int, Nothing}
    time_zone::Union{String, Nothing}
    url::Union{String, Nothing}
    utc_offset::Union{Int, Nothing}
    verified::Union{Bool, Nothing}
    #withheld_in_countries::Union{String, Nothing}
    withheld_in_countries::Union{Array, Nothing}
    withheld_scope::Union{String, Nothing}
end

#Tweets response object
mutable struct Tweets <: TwitterType
    contributors::Union{Array, Nothing}
    coordinates::Union{Dict, Nothing}
    created_at::Union{String, Nothing}
    current_user_retweet::Union{Dict, Nothing}
    entities::Union{Dict, Nothing}
    favorite_count::Union{Int, Nothing}
    favorited::Union{Bool, Nothing}
    filter_level::Union{String, Nothing}
    full_text::Union{String, Nothing}
    id::Union{Int64, Nothing}
    id_str::Union{String, Nothing}
    in_reply_to_screen_name::Union{String, Nothing}
    in_reply_to_status_id::Union{Int64, Nothing}
    in_reply_to_status_id_str::Union{String, Nothing}
    in_reply_to_user_id::Union{Int64, Nothing}
    in_reply_to_user_id_str::Union{String, Nothing}
    lang::Union{String, Nothing}
    place::Union{Dict, Nothing}
    possibly_sensitive::Union{Bool, Nothing}
    scopes::Union{Dict, Nothing}
    retweet_count::Union{Int, Nothing}
    retweeted::Union{Bool, Nothing}
    retweeted_status::Union{Dict, Nothing}
    source::Union{String, Nothing}
    text::Union{String, Nothing}
    truncated::Union{Bool, Nothing}
    user::Union{Dict, Nothing}
    withheld_copyright::Union{Bool, Nothing}
    withheld_in_countries::Union{Array, Nothing}
    withheld_scope::Union{String, Nothing}
end

#Lists response object
mutable struct Lists <: TwitterType
    created_at::Union{String, Nothing}
    description::Union{String, Nothing}
    following::Union{Bool, Nothing}
    full_name::Union{String, Nothing}
    id::Union{Int64, Nothing}
    id_str::Union{String, Nothing}
    member_count::Union{Int, Nothing}
    mode::Union{String, Nothing}
    name::Union{String, Nothing}
    slug::Union{String, Nothing}
    subscriber_count::Union{Int, Nothing}
    uri::Union{String, Nothing}
    user::Union{Dict, Nothing}
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

Tweets(response::Vector) = Tweets[Tweets(x) for x in response]
Users(response::Vector) = Users[Users(x) for x in response]
Lists(response::Vector) = Lists[Lists(x) for x in response]
Places(response::Vector) = Places[Places(x) for x in response]
