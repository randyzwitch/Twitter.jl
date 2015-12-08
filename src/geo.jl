#############################################################
#
# Places & Geo Functions
#
#############################################################

function get_geo_id_place_id(place_id::AbstractString; options=Dict{AbstractString, AbstractString}())

    r = get_oauth("https://api.twitter.com/1.1/geo/id/$(place_id).json", options)

    return r.status == 200 ? to_PLACES(Requests.json(r)) : r

end

function get_geo_reverse_geocode(lat::AbstractString, long::AbstractString; options=Dict{AbstractString, AbstractString}())

    #Add required parameter(s) to options dict
    options["lat"] = lat
    options["long"] = long

    r = get_oauth("https://api.twitter.com/1.1/geo/reverse_geocode.json", options)

    #return to_PLACES(r["result"]["places"])
    return r.status == 200 ? to_PLACES(Requests.json(r)["result"]["places"]) : r

end

function get_geo_search(; options=Dict{AbstractString, AbstractString}())

    r = get_oauth("https://api.twitter.com/1.1/geo/search.json", options)

    #return to_PLACES(r["result"]["places"])
    return r.status == 200 ? to_PLACES(Requests.json(r)["result"]["places"]) : r

end

function get_geo_similar_places(lat::AbstractString, long::AbstractString, name::AbstractString; options=Dict{AbstractString, AbstractString}())

    #Add required parameter(s) to options dict
    options["lat"] = lat
    options["long"] = long
    options["name"] = name

    r = get_oauth("https://api.twitter.com/1.1/geo/similar_places.json", options)

    #return to_PLACES(r["result"]["places"])
    return r.status == 200 ? to_PLACES(Requests.json(r)["result"]["places"]) : r

end