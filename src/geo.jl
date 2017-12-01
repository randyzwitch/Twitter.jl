#############################################################
#
# Places & Geo Functions
#
#############################################################

function get_geo_id_place_id(place_id::String; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/geo/id/$(place_id).json", options)

    return r.status == 200 ? JSON.parse(String(r.data)) : error("Twitter API returned $(r.status) status")

end

function get_geo_reverse_geocode(lat::String, long::String; options=Dict{String, String}())

    #Add required parameter(s) to options dict
    options["lat"] = lat
    options["long"] = long

    r = get_oauth("https://api.twitter.com/1.1/geo/reverse_geocode.json", options)

    #return to_PLACES(r["result"]["places"])
    #return r.status == 200 ? to_PLACES(Requests.json(r)["result"]["places"]) : r
    return r.status == 200 ? JSON.parse(String(r.data)) : error("Twitter API returned $(r.status) status")


end

function get_geo_search(; options=Dict{String, String}())

    r = get_oauth("https://api.twitter.com/1.1/geo/search.json", options)

    #return to_PLACES(r["result"]["places"])
    #return r.status == 200 ? to_PLACES(Requests.json(r)["result"]["places"]) : r
    return r.status == 200 ? JSON.parse(String(r.data)) : error("Twitter API returned $(r.status) status")

end

function get_geo_similar_places(lat::String, long::String, name::String; options=Dict{String, String}())

    #Add required parameter(s) to options dict
    options["lat"] = lat
    options["long"] = long
    options["name"] = name

    r = get_oauth("https://api.twitter.com/1.1/geo/similar_places.json", options)

    #return to_PLACES(r["result"]["places"])
    #return r.status == 200 ? to_PLACES(Requests.json(r)["result"]["places"]) : r
    return r.status == 200 ? JSON.parse(String(r.data)) : error("Twitter API returned $(r.status) status")

end
