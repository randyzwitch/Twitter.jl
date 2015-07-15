#############################################################
#
# Trends Functions
#
#############################################################

function get_trends_place(id::String; options=Dict{String, String}())

    #Add required parameter(s) to options dict
    options["id"] = id

    r = get_oauth("https://api.twitter.com/1.1/trends/place.json", options)

    return r.status == 200 ? JSON.parse(r.data) : r

end

function get_trends_closest(lat::String, long::String; options=Dict{String, String}())

    #Add required parameter(s) to options dict
    options["lat"] = lat
    options["long"] = long

    r = get_oauth("https://api.twitter.com/1.1/trends/closest.json", options)

    return r.status == 200 ? JSON.parse(r.data) : r

end