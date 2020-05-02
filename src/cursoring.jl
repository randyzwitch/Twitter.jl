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
parse_results(cursorable, newdata::Dict, api_options, data_holder, cur_count)

Internal function. parses Twitter API results by determining the type of data and organizing
    for cursorized processing.

    There are two methods, this one takes a DICT object, indicating a set of user IDs or search results.
    returns cursorable, newdata, api_options, cur_count.

# Examples
```julia-repl
julia> parse_results(cursorable, newdata::Dict, api_options, data_holder, cur_count)
  ...
```
"""
function parse_results(cursorable, newdata::Dict, api_options, data_holder, cur_count)
    # Handle data type to cursor
    if haskey(newdata, "ids")
        newdata["ids"] = vcat(data_holder, newdata["ids"])
        cur_count += length(newdata["ids"])
        cursorable = (newdata["next_cursor"] != 0) & (cur_count < api_options["count"] )
        api_options["cursor"] = newdata["next_cursor"]
    elseif haskey(newdata, "statuses")
        out = [Tweets(x) for x in newdata["statuses"]]
        newdata["statuses"] = vcat(data_holder, out)
        cur_count += length(newdata["statuses"])
        cursorable = cur_count < api_options["count"]
        api_options["max_id"] = minimum(x.id for x in newdata["statuses"])
    else
        cur_count += length(newdata)
        cursorable = cur_count < api_options["count"]
    end
    cursorable, newdata, api_options, cur_count
end

"""
parse_results(cursorable, newdata::Array, api_options, data_holder, cur_count)

Internal function. parses Twitter API results by determining the type of data and organizing appropriately.
    There are two methods, this one takes an ARRAY object, indicating a set of Tweets.
    returns cursorable, newdata, api_options, cur_count

# Examples
```julia-repl
julia> parse_results(cursorable, newdata::Array, api_options, data_holder, cur_count)
  ...
```
"""
function parse_results(cursorable, newdata::Array, api_options, data_holder, cur_count)
    newdata = Tweets[Tweets(x) for x in newdata]
    length(newdata) == 0 && return false, data_holder, api_options, cur_count
    # tree of options for max_id or since id
    cur_count += length(newdata)
    cursorable = cur_count < api_options["count"]
    api_options["max_id"] = minimum([x.id for x in newdata])-1  # get min id
    newdata = vcat(data_holder, newdata)
    cursorable, newdata, api_options, cur_count
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
    data_holder = haskey(newdata, "ids") ? newdata["ids"] : haskey(newdata, "statuses") ? newdata["statuses"] : [] # save existing ids
    api_options = copy(options) # the get_oauth overwrites options, so store the correct data here
    # Option to use reconnect or not
    # Check for reconnect argument

    r = get_oauth("https://api.twitter.com/1.1/`$endp`", options)
    if r.status == 200
        newdata = JSON.parse(String(r.body))
        cursorable, newdata, api_options, cur_count = parse_results(cursorable, newdata, api_options, data_holder, cur_count)
        cursorable, newdata, api_options, endp, cur_count
    else
        error("Twitter API returned `$(r.status)` status")
    end
end

"""
cursor(cursorable::Bool, newdata::Dict, options::Dict, endp::String, cur_count::Integer)

Internal function for gathering . Takes a tuple and returns a tuple of equal size, calls the Twitter API
    until the desired count of records is recovered or until the API exhausts its limits.

    Note: when an ARRAY object is provided as the data, this function assumes you are gathering
    a tweet timeline.

    Note: when  retrieving tweets, the API always starts with the most recent. Therefore,
    if you want a chunk of older tweets, you must specify both since_id, and max_id when cursoring.

# Examples
```julia-repl
julia>  while cursorable & (length(newdata["ids"]) < count)
            cursorable, newdata, options, endp = cursor(cursorable, newdata, options, endp)
        end
```
"""
function cursor(cursorable::Bool, newdata::Array, options::Dict, endp::String, cur_count::Integer)
    cursorable == false && return cursorable, newdata, options, endp, cur_count
    data_holder = copy(newdata) # save existing ids
    api_options = copy(options) # the get_oauth overwrites options, so store the correct data here

    # Check for reconnect argument
    if haskey(options, "skip_reconnect") && options["skip_reconnect"]==true
        @debug "skipping reconnect loop. Warning, you could be rate limited!"
    else
        cur_alloc = reconnect($endp) # start reconnect loop
        remaining_calls = cur_alloc["remaining"]
        @debug "`$remaining_calls` calls left on this endpoint."
    end

    r = get_oauth("https://api.twitter.com/1.1/$endp", options)
    if r.status == 200
        # parse and put into proper type form
        newdata = JSON.parse(String(r.body))
        cursorable, newdata, api_options, cur_count = parse_results(cursorable, newdata, api_options, data_holder, cur_count)
        cursorable, newdata, api_options, endp, cur_count
    else
        error("Twitter API returned $(r.status) status")
    end
end


########### EXPORTED FUNCTIONS.......

"""
get_followers_ids(; kwargs...)
Get a Dict object of follower ids from a particular Twitter user. This function will call the API as
many times as allowed or until the desired `max_records` is reached, whichever comes first.
# Examples
```julia-repl
julia> get_followers_ids(screen_name = "jack", count = 10_000)
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
        options["count"] = 1
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
julia> get_friends_ids(screen_name = "barackobama", count = 1000)
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
        options["count"] = 1
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
Get an array object of mentions for a particular Twitter user. This function will call the API until the
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
        options["count"] = 1
        count = 1
    end
    cur_count = 0
    # make the first call to the API
    cursorable = true
    newdata = Tweets[]

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
        options["count"] = 1
        count = 1
    end
    cur_count = 0
    # make the first call to the API
    cursorable = true
    newdata = Tweets[]

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
julia> get_home_timeline(count = 1000)
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
        options["count"] = 1
        count = 1
    end
    cur_count = 0
    # make the first call to the API
    cursorable = true
    newdata = Tweets[]

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
        options["count"] = 1
        count = 1
    end
    cur_count = 0
    # make the first call to the API
    cursorable = true
    newdata = Tweets[]

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
        options["count"] = 1
        count = 1
    end
    cur_count = 0
    # make the first call to the API
    cursorable = true
    newdata = Tweets[]

    while cursorable & (length(newdata) < count)
        cursorable, newdata, options, endp, cur_count = cursor(cursorable, newdata, options, endp, cur_count)
    end
    newdata
end
