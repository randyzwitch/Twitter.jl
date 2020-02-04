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

# Backoff function: a macro to check status of the current endpoint and implement a sleep function

# get endpoint
# capture the error message
# capture the length of time until it's ok to continue

#using Twitter, Test
#using JSON, OAuth

#TWITTERCRED = twitterauth(ENV["CONSUMER_KEY"], ENV["CONSUMER_SECRET"], ENV["ACCESS_TOKEN"], ENV["ACCESS_TOKEN_SECRET"])

# This is how you get the current limit from the Pairs r.headers object

#endp = "statuses/home_timeline.json"

function parse_options(;kwargs...)
    options = Dict{String, Any}()
    for arg in kwargs
        options[string(arg[1])] = arg[2]
    end
    options
end


api_info, out = copy(r.headers), copy(r.body)
remaining_calls = [x.second for x in api_info if x.first=="x-rate-limit-remaining"]
reset_time = [x.second for x in api_info if x.first=="x-rate-limit-reset"]

# The plan:

# reverse lookup the dict

# uses pipe package0
get_endpoint_allocation  = function(endp)
    try
        api_info = get_application_rate_limit_status()
        endpoint_match = match( r"^.*/", endp).match # get everything before the slash
        base_endpoint =  strip(endpoint_match, '/') #remove the slash
        final_endpoint = replace(endp, ".json" => "") # remove the .json
        resource_dict = api_info["resources"][base_endpoint_str]["/"*final_endpoint] # get the final endpoint data
    catch
        Dict("remaining" => 0, "reset" => round(Int64, time())+240, "limit" => 0) #if nothing, wait fifteen
    end
end

# back off loop
function reconnect(endp, reconnects=0)
    while get_endpoint_allocation(endp)["remaining"]==0
        reconnects += 1
        alloc = get_endpoint_allocation(endp)
        cur_time = round(Int64, time())
        sleeptime = abs(alloc["reset"] - cur_time)
        println("Endpoint exhausted, sleeping for $sleeptime seconds..")
        sleep(sleeptime^reconnects)
    end
    return get_endpoint_ation(endp)
end

# just needs testing
macro backoff(ex)
    if (typeof(ex.args[2])==Expr) & (ex.args[2].args[2]==:endp)
        local endp = ex.args[2].args[2]
        cur_alloc = reconnect(eval(endp)) # start reconnect loop
        remaining_calls = cur_alloc["remaining"]
        println("$remaining_calls calls left on this endpoint.")
        sleep(rand(1:3))
        eval(ex)
    else
        error("Expression not compatible with this macro, must have endpoint argument.")
    end
end

## TESTING

#options = parse_options(count = 1)
#r = @backoff get_oauth("https://api.twitter.com/1.1/$endp", options)
