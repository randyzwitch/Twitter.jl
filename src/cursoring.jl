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
"""
cursor(cursorable::Bool, newdata::Dict, options::Dict, endp::String, cur_count::Integer)

Internal function method for gathering IDS. Takes a tuple and returns a tuple of equal size, calls the Twitter API
    until the desired count of records is recovered or until the API exhausts its limits.

    Note: when a DICT object is provided as the data, this function assumes you are gathering
    follower or friends ids.

# Examples
```julia-repl
julia>  while cursorable & (length(newdata["ids"]) < min_records)
            cursorable, newdata, options, kwargs, endp = cursor(cursorable, newdata, options, kwargs, endp)
        end
```
"""
################# cursor when new data is a Dict object - like followers or friends IDS
function cursor(cursorable::Bool, newdata::Dict, options::Dict, endp::String, cur_count::Integer)
    cursorable == false && return cursorable, newdata, options, endp, cur_count
    data_holder = haskey(newdata, "ids") ? newdata["ids"] : [] # save existing ids
    api_options = copy(options) # the get_oauth overwrites options, so store the correct data here
    r = get_oauth("https://api.twitter.com/1.1/$endp", options)
    if r.status == 200
        newdata = JSON.parse(String(r.body))
        # Handle data type to cursor
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

"""
cursor(cursorable::Bool, newdata::Dict, options::Dict, endp::String, cur_count::Integer)

Internal function for gathering . Takes a tuple and returns a tuple of equal size, calls the Twitter API
    until the desired count of records is recovered or until the API exhausts its limits.

    Note: when an ARRAY object is provided as the data, this function assumes you are gathering
    a tweet timeline.

# Examples
```julia-repl
julia>  while cursorable & (length(newdata["ids"]) < count)
            cursorable, newdata, options, endp = cursor(cursorable, newdata, options, endp)
        end
```
"""
function cursor(cursorable::Bool, newdata::Array, options::Dict, endp::String, cur_count::Integer)
    cursorable == false && return cursorable, newdata, options, endp, cur_count
    data_holder = newdata # save existing ids
    api_options = copy(options) # the get_oauth overwrites options, so store the correct data here
    r = get_oauth("https://api.twitter.com/1.1/$endp", options)
    if r.status == 200
        # parse and put into proper type form
        newdata = [Tweets(x) for x in JSON.parse(String(r.body))]
        length(newdata) == 0 && return cursorable, newdata, api_options, endp, cur_count
        # tree of options for max_id or since id
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


"""
get_followers_ids(; kwargs...)
Get a Dict object of follower ids from a particular Twitter user. This function will call the API as
many times as allowed or until the desired `max_records` is reached, whichever comes first.
# Examples
```julia-repl
julia> get_followers_ids(screen_name = "jack", min_records = 10_000)
Dict{String,Any} with 6 entries:
  "previous_cursor_str" => "0"
  ...
```
"""
function get_followers_ids(; kwargs...)
    # Could be doing some pre-allocation here to optimize performance,
    # but since this is an API function that only deals with 25K records at most...
    endp = "followers/ids.json"
    options = parse_options(kwargs)

    if "count" ∈ keys(options)
        count = options["count"]
    else
        count = 1 # default to one record
    end

    cur_count = 0
    cursorable = true
    newdata = Dict{String,Any}()
    newdata["ids"] = [] #Array{String,1}[]

    while cursorable & (length(newdata["ids"]) < count)
        cursorable, newdata, options, endp, cur_count = cursor(cursorable, newdata, options, endp, cur_count)
    end
    newdata
end

"""
get_friends_ids(; kwargs...)
Get a Dict object of follower ids from a particular Twitter user. This function will call the API as
until the desired `count` is reached or the API runs out, whichever comes first.
# Examples
```julia-repl
julia> get_friends_ids(screen_name = "twitter", min_records = 1000)
```
"""
function get_friends_ids(; kwargs...)
    # Could be doing some pre-allocation here to optimize performance,
    # but since this is an API function that only deals with 25K records at most...
    endp = "friends/ids.json"
    options = parse_options(kwargs)

    if "count" ∈ keys(options)
        count = options["count"]
    else
        count = 1 # default to one record
    end

    cur_count = 0
    cursorable = true
    newdata = Dict{String,Any}()
    newdata["ids"] = [] #Array{String,1}[]

    while cursorable & (length(newdata["ids"]) < count)
        cursorable, newdata, options, endp, cur_count = cursor(cursorable, newdata, options, endp, cur_count)
    end
    newdata
end

########################## OTHER TYPE:

"""
get_mentions_timeline(; kwargs...)
Get an array object of timeline tweets from a particular Twitter user. This function will call the API until the
desired `count` is reached or the API runs out, whichever comes first.
# Examples
```julia-repl
julia> get_mentions_timeline(screen_name = "twitter", count = 1000)
```
"""
function get_mentions_timeline(; kwargs...)
    # Could be doing some pre-allocation here to optimize performance,
    # but since this is an API function that only deals with 25K records at most...
    endp = "statuses/mentions_timeline.json"
    options = parse_options(kwargs)

    if "count" ∈ keys(options)
        count = options["count"]
    else
        count = 1
    end
    cur_count = 0
    # make the first call to the API
    cursorable = true
    newdata = []

    while cursorable & (length(newdata) < count)
        cursorable, newdata, options, endp, cur_count = cursor(cursorable, newdata, options, endp, cur_count)
    end
    newdata
end


"""
get_user_timeline(; kwargs...)
Get an array object of timeline tweets from a particular Twitter user. This function will call the API until the
desired `count` is reached or the API runs out, whichever comes first.
# Examples
```julia-repl
julia> get_user_timeline(screen_name = "twitter", count = 1000)
```
"""
function get_user_timeline(; kwargs...)
    # Could be doing some pre-allocation here to optimize performance,
    # but since this is an API function that only deals with 25K records at most...
    endp = "statuses/user_timeline.json"
    options = parse_options(kwargs)

    if "count" ∈ keys(options)
        count = options["count"]
    else
        count = 1
    end
    cur_count = 0
    # make the first call to the API
    cursorable = true
    newdata = []

    while cursorable & (length(newdata) < count)
        cursorable, newdata, options, endp, cur_count = cursor(cursorable, newdata, options, endp, cur_count)
    end
    newdata
end

"""
get_home_timeline(; kwargs...)
Get an array object of timeline tweets from the owning user. This function will call the API until the
desired `count` is reached or the API runs out, whichever comes first.
# Examples
```julia-repl
julia> get_hone_timeline(count = 1000)
```
"""
function get_home_timeline(; kwargs...)
    # Could be doing some pre-allocation here to optimize performance,
    # but since this is an API function that only deals with 25K records at most...
    endp = "statuses/home_timeline.json"
    options = parse_options(kwargs)

    if "count" ∈ keys(options)
        count = options["count"]
    else
        count = 1
    end
    cur_count = 0
    # make the first call to the API
    cursorable = true
    newdata = []

    while cursorable & (length(newdata) < count)
        cursorable, newdata, options, endp, cur_count = cursor(cursorable, newdata, options, endp, cur_count)
    end
    newdata
end

"""
get_retweets_of_me(; kwargs...)
Get an array object of retweets from the owning user. This function will call the API until the
desired `count` is reached or the API runs out, whichever comes first.
# Examples
```julia-repl
julia> get_retweets_of_me(count = 1000)
```
"""
function get_retweets_of_me(; kwargs...)
    # Could be doing some pre-allocation here to optimize performance,
    # but since this is an API function that only deals with 25K records at most...
    endp = "statuses/retweets_of_me.json"
    options = parse_options(kwargs)

    if "count" ∈ keys(options)
        count = options["count"]
    else
        count = 1
    end
    cur_count = 0
    # make the first call to the API
    cursorable = true
    newdata = []

    while cursorable & (length(newdata) < count)
        cursorable, newdata, options, endp, cur_count = cursor(cursorable, newdata, options, endp, cur_count)
    end
    newdata
end

"""
get_retweets_of_me(; kwargs...)
Get an array object of retweets from the owning user. This function will call the API until the
desired `count` is reached or the API runs out, whichever comes first.
# Examples
```julia-repl
julia> get_retweets_of_me(count = 1000)
```
"""
function get_search_tweets(; kwargs...)
    # Could be doing some pre-allocation here to optimize performance,
    # but since this is an API function that only deals with 25K records at most...
    endp = "search/tweets.json"
    options = parse_options(kwargs)

    if "count" ∈ keys(options)
        count = options["count"]
    else
        count = 1
    end
    cur_count = 0
    # make the first call to the API
    cursorable = true
    newdata = []

    while cursorable & (length(newdata) < count)
        cursorable, newdata, options, endp, cur_count = cursor(cursorable, newdata, options, endp, cur_count)
    end
    newdata
end
