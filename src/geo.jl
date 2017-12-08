#############################################################
#
# Places & Geo Functions
#
#############################################################

function get_geo_id_place_id(place_id::String; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/geo/id/$(place_id).json", options)

    return r.status == 200 ? JSON.parse(String(r.body)) : error("Twitter API returned $(r.status) status")

end
