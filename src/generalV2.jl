#Function that builds global variable to hold authentication keys
#TODO: Figure out how to do OAuth authentication directly, rather than user putting in credentials directly
function twitterauth(consumer_key::String, consumer_secret::String, oauth_token::String, oauth_secret::String)
    #Create a global variable to hold return from this function
    global TWITTERCRED

    return TWITTERCRED = TWCredential(consumer_key, consumer_secret, oauth_token, oauth_secret)

end

#General functions for OAuth authenticated GET/POST request
get_oauth(endpoint::String, options::Dict) = oauth_request_resource(endpoint, "GET", options, TWITTERCRED.consumer_key, TWITTERCRED.consumer_secret, TWITTERCRED.oauth_token, TWITTERCRED.oauth_secret)

post_oauth(endpoint::String, options::Dict) = oauth_request_resource(endpoint, "POST", options, TWITTERCRED.consumer_key, TWITTERCRED.consumer_secret, TWITTERCRED.oauth_token, TWITTERCRED.oauth_secret)

# a variety of function are macrogenerated, they are straightforwardly called
# four functions are cursorable, and call tweets or user ids, they are dealt with below
# TODO: remove kwargs from

"""
parse_options(kwargs)

Internal function. Takes the keyword arguments from the main function and parses it into a
    usable Dict object

# Examples
```julia-repl
julia> parse_options(ex::Expr)
Dict{String,Any} with 2 entries:
  "screen_name" => "jack"
  ...
```
"""
function parse_options(kwargs)
    options = Dict{String, Any}()
    for arg in kwargs
        options[string(arg[1])] = arg[2]
    end
    options
end
get_kwargs = function(; kwargs...)
    kwargs
end

"""
cursorize(cursorable, newdata, options, kwargs, endp)

Internal function. Takes a tuple and returns a tuple of equal size, calls the Twitter API
    until the minimum number of records is recovered

# Examples
```julia-repl
julia>  while cursorable & (length(newdata["ids"]) < min_records)
            cursorable, newdata, options, kwargs, endp = cursorize(cursorable, newdata, options, kwargs, endp)
        end
```
"""
################# cursorize when new data is a Dict object - like followers or friends IDS
function cursorize(cursorable::Bool, newdata::Dict, options::Dict, endp::String, cur_count::Integer)
    cursorable == false && return cursorable, newdata, options, endp, cur_count
    data_holder = haskey(newdata, "ids") ? newdata["ids"] : [] # save existing ids
    api_options = copy(options) # the get_oauth overwrites options, so store the correct data here
    r = get_oauth("https://api.twitter.com/1.1/$endp", options)
    if r.status == 200
        newdata = JSON.parse(String(r.body))
        # Handle data type to cursorize
        if haskey(newdata, "next_cursor")
            newdata["ids"] = vcat(data_holder, newdata["ids"])
            cur_count += length(newdata["ids"])
            cursorable = (newdata["next_cursor"] != 0) & (cur_count < api_options["count"] )
            api_options["cursor"] = newdata["next_cursor"]
        else
            cur_count += length(newdata)
            cursorable = cur_count < api_options["count"]
        end
        cursorable, newdata, api_options, endp, cur_count
    else
        error("Twitter API returned $(r.status) status")
    end
end

# PLAYGROUND TO REMOVE KWARGS from cursorize

## TEST ON the followers endpoint
kwargs = get_kwargs(screen_name = "stefanjwojcik", count = 100)
api_options = parse_options(kwargs)
options = copy(api_options)
cursorable, newdata, endp, cur_count = true, Dict(), "followers/ids.json", 0
#r = get_oauth("https://api.twitter.com/1.1/$endp", options)
cursorable, newdata, api_options, endp, cur_count = cursorize(true, Dict(), api_options, endp, 0)
cursorable, newdata, api_options, endp, cur_count = cursorize(cursorable, newdata, api_options, endp, cur_count)

### cursorize when the data object is an ARRAY object
function cursorize(cursorable::Bool, newdata::Array, options::Dict, endp::String, cur_count::Integer)
    cursorable == false && return cursorable, newdata, options, endp, cur_count
    data_holder = newdata # save existing ids
    api_options = copy(options) # the get_oauth overwrites options, so store the correct data here
    r = get_oauth("https://api.twitter.com/1.1/$endp", options)
    if r.status == 200
        # parse and put into proper type form
        newdata = [Tweets(x) for x in JSON.parse(String(r.body))]
        if haskey(api_options, "max_id")
            cur_count += length(newdata)
            cursorable = cur_count < api_options["count"]
            api_options["max_id"] = minimum([x.id for x in newdata])  # get min id
        elseif haskey(api_options, "since_id")
            cur_count += length(newdata)
            cursorable = cur_count < api_options["count"]
            api_options["since_id"] = maximum([x.id for x in newdata])
        else
            cur_count += length(newdata)
            cursorable = cur_count < api_options["count"]
        end
        newdata = vcat(data_holder, newdata)
        cursorable, newdata, api_options, endp, cur_count
    else
        error("Twitter API returned $(r.status) status")
    end
end


## TEST ON the timeline endpoint
kwargs = get_kwargs(screen_name = "twitter", count = 1)
api_options = parse_options(kwargs)
options = copy(api_options)
cursorable, newdata, endp, cur_count = true, [], "statuses/user_timeline.json", 0
#r = get_oauth("https://api.twitter.com/1.1/$endp", options)
cursorable, newdata, api_options, endp, cur_count = cursorize(true, [], api_options, endp, 0)
max_id = minimum([x.id for x in newdata])
api_options["max_id"] = max_id
api_options["count"] = 100
cursorable, newdata, api_options, endp, cur_count = cursorize(true, newdata, api_options, endp, 1)


function get_TK_ids(; kwargs...)
    # Could be doing some pre-allocation here to optimize performance,
    # but since this is an API function that only deals with 25K records at most...
    endp = "followers/ids.json"
    options = parse_options(kwargs)

    if "min_records" ∈ keys(options)
        min_records = parse(Int, options["min_records"])
    else
        min_records = 1
    end
    # make the first call to the API
    cursorable = true
    newdata = Dict{String,Any}()
    newdata["ids"] = [] #Array{String,1}[]

    while cursorable & (length(newdata["ids"]) < min_records)
        cursorable, newdata, options, kwargs, endp = cursorize(cursorable, newdata, options, kwargs, endp)
    end
    newdata
end

## getting tweets
function get_user_timeline(; kwargs...)
    # Could be doing some pre-allocation here to optimize performance,
    # but since this is an API function that only deals with 25K records at most...
    endp = "statuses/user_timeline.json"
    options = parse_options(kwargs)

    if "count" ∈ keys(options)
        count = parse(Int, options["count"])
    else
        count = 1
    end
    cur_count = 0
    # make the first call to the API
    cursorable = true
    newdata = []

    while cursorable & (length(newdata) < count)
        cursorable, newdata, options, endp, cur_count = cursorize(cursorable, newdata, options, endp, cur_count)
    end
    newdata
end
