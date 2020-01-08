

using Twitter
using JSON

twitterauth(ENV["CONSUMER_KEY"],ENV["CONSUMER_SECRET"],ENV["ACCESS_TOKEN"],ENV["ACCESS_TOKEN_SECRET"])

mentions_timeline_default = get_mentions_timeline()
tw = mentions_timeline_default[1]
tw_df = DataFrame(mentions_timeline_default)
@test 0 <= length(mentions_timeline_default) <= 20
@test typeof(mentions_timeline_default) == Vector{Tweets}
@test typeof(tw) == Tweets
@test size(tw_df)[2] == 30


user_timeline_default = get_user_timeline(screen_name = "randyzwitch")

frs = get_friends_ids(screen_name = "randyzwitch")

fols = get_followers_ids(screen_name = "randyzwitch")

# can only get 5K at a time
fols = get_followers_ids(screen_name = "jack")
fols2 = get_followers_ids(screen_name = "jack", next_cursor = 1651244536622177747)

# can write a function that takes a function and cursorizes, but not iterates

mutable struct Cursorable
        body::Dict
		screen_name::String
	    cursor::Int
        f::Function
        function Cursorable(body::Dict = Dict(), screen_name = "", cursor=-1, f = get_followers_ids)
                newcursor = new()
                newcursor.body = body
                newcursor.screen_name = screen_name
                newcursor.cursor = cursor
                newcursor.f = f
                newcursor
        end
end

mycursor = Cursorable(Dict(), "stefanjwojcik", -1, get_followers_ids)

Base.iterate(T::Cursorable) = T, T.cursor

# feed the existing object and existing cursor into the iteration
function Base.iterate(T::Cursorable, cursor)
    if cursor == 0 # no more valid entries
        nothing
    else
        newbody = T.f(screen_name = T.screen_name)
        Cursorable(newbody, T.screen_name, newbody["next_cursor"], T.f), newbody["next_cursor"]
    end
 end

# will get 5000 ids for each go of the cursor
# to do: need to create a waiting period if 15 min haven't elapsed and results
# not complete
for element in mycursor
    println(element)
end





# create a cursor for friend ids
mycursor = Cursorable(Dict(), "stefanjwojcik", -1, get_friends_ids)

test_friend_ids = fill(0, 0)

for element in mycursor
    if "ids" ∈ keys(element.body)
        append!(test_friend_ids, element.body["ids"])
    end
end

@test length(test_friend_ids) > 200 > 300

# create a test cursor for followers ids
mycursor = Cursorable(Dict(), "stefanjwojcik", -1, get_followers_ids)

test_follower_ids = fill(0, 0)

for element in mycursor
    if "ids" ∈ keys(element.body)
        append!(test_follower_ids, element.body["ids"])
    end
end

@test length(test_follower_ids) > 500 > 600

## ORIGINAL FUNCTION
function get_friends_ids(; kwargs...)

    options = Dict{String, Any}()
    for arg in kwargs
        options[string(arg[1])] = string(arg[2])
    end

    # make the first call to the API
    r = get_oauth("https://api.twitter.com/1.1/friends/ids.json", options)

    if r.status == 200
        success = JSON.parse(String(r.body))

    else
        error("Twitter API returned $(r.status) status")
    end

end

## PSEUDO-CODE FOR NEW FUNCTION
function get_follow_ids(; kwargs...)

    # Should be doing some pre-allocation here to optimize performance
    options = Dict{String, Any}()
    for arg in kwargs
        options[string(arg[1])] = string(arg[2])
    end

    if "max_records" ∈ keys(options)
        max_records = parse(Int, options["max_records"])
    else
        max_records = 0
    end
    # make the first call to the API
    cursorable = true
    newdata = Dict{String,Any}()
    data_holder = Array{Any,1}() # hold updated array

    while cursorable & (length(data_holder) < max_records)
        try
            r = get_oauth("https://api.twitter.com/1.1/followers/ids.json", options)

            if r.status == 200
                newdata = JSON.parse(String(r.body))
                options = Dict{String, Any}()
                options["screen_name"] = kwargs[:screen_name]
                cursorable = newdata["next_cursor"]!=0
                options["cursor"] = newdata["next_cursor"]
                data_holder = vcat(data_holder, newdata["ids"])
            else
                cursorable = false
                error("Twitter API returned $(r.status) status")
            end
        catch exc
            println("API error: $exc")
            cursorable = false
            newdata["ids"] = data_holder
            newdata
        end
    end
    newdata["ids"] = data_holder
    newdata
end


# if there is an max_records option, then call a secondary
# function to cursorize the function call until it runs out of records

# followers
# friends
#

function get_follow_ids_V2(; kwargs...)

    # Could be doing some pre-allocation here to optimize performance,
    # but since this is an API function that only deals with 25K records at most...
    options = Dict{String, Any}()
    for arg in kwargs
        options[string(arg[1])] = string(arg[2])
    end

    if "max_records" ∈ keys(options)
        max_records = parse(Int, options["max_records"])
    else
        max_records = 0
    end
    # make the first call to the API
    cursorable = true
    newdata = Dict{String,Any}()
    data_holder = Array{Any,1}() # hold updated array

    while cursorable & (length(data_holder) < max_records)
        r = get_oauth("https://api.twitter.com/1.1/followers/ids.json", options)
        if r.status == 200
            newdata = JSON.parse(String(r.body))
            options = Dict{String, Any}()
            options["screen_name"] = kwargs[:screen_name]
            cursorable = newdata["next_cursor"]!=0
            options["cursor"] = newdata["next_cursor"]
            data_holder = vcat(data_holder, newdata["ids"])
        else
            cursorable = false
            error("Twitter API returned $(r.status) status")
        end
    end
    newdata["ids"] = data_holder
    newdata
end


##################### REVISING MACRO macrogenerated

#### MORE functions


# breaking down general functions into bite-size pieces

function parse_options(kwargs)
    options = Dict{String, Any}()
    for arg in kwargs
        options[string(arg[1])] = string(arg[2])
    end
    options
end

# cursorize

# made to be the same for all cursorizeable ID-like functions
function cursorize(cursorable, newdata, options, kwargs, endp)
    data_holder = newdata["ids"] # save existing ids
    r = get_oauth("https://api.twitter.com/1.1/$endp", options)
    if r.status == 200
        newdata = JSON.parse(String(r.body))
        options = Dict{String, Any}()
        options["screen_name"] = kwargs[:screen_name]
        cursorable = newdata["next_cursor"]!=0
        options["cursor"] = newdata["next_cursor"]
        newdata["ids"] = vcat(data_holder, newdata["ids"])
        cursorable, newdata, options, kwargs, endp
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
function get_followers_2(; kwargs...)
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




macro time(ex)
    quote
        local t0 = time()
        local val = $(esc(ex))
        local t1 = time()
        println("elapsed time: ", t1-t0, " seconds")
        val
    end
end

# this macro reads the intended function and alters the expression before running
# TODO: add 'cursorize' as info in endpoint_tuple
# @twitter get_follow_ids(screen_name = "stefanjwojcik", min_ids = 1)
# @twitter get_user_timeline(screen_name = "stefanjwojcik")

macro twitter(ex)
    quote
        func = string(ex.args[1])
        verb = func[1:3]=="get" ? "get_oauth" : "post_oauth" # parse get vs. post
        # do tuple lookup to reference the app. endpoint
        endp = [z for (x,y,z,w) in endpoint_tuple if string(y)==func]
        # parse args, call endpoint, cursorize
        options = parse_options(ex)

        if id_cursorable
            cursorize(func, endp, options)
        elseif text_cursorable
            text_cursorize(func, endp, options)
        else
            call_endpoint(endp, func, options)

    end
end
