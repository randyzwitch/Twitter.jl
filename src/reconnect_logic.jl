# reconnect logic

# Need to define get_application_rate_limit_status in order to make it available to get_endpoint_allocation

function get_application_rate_limit_status(;kwargs...)
    endp = "application/rate_limit_status.json"
    #Take kwargs array of tuples, create dict needed by OAuth process
    options = Dict{String, Any}()
    for arg in kwargs
        options[string(arg[1])] = string(arg[2])
    end

    # defines the functions
    r = get_oauth("https://api.twitter.com/1.1/$endp", options)

    #If successful API call, return JSON as Julia data structure, otherwise return error
    if r.status == 200
        success = JSON.parse(String(r.body))
    else
        error("Twitter API returned $(r.status) status")
    end

end


# retrieve endpoint remaining calls
get_endpoint_allocation  = function(endp, endp_deduction=0)

    if !@isdefined(API_INFO) || API_INFO==nothing
        global API_INFO = get_application_rate_limit_status()
    end
    #logic to acquire the correct endpoint
    endpoint_match = match( r"^.*/", endp).match # get everything before the slash
    base_endpoint =  strip(endpoint_match, '/') #remove the slash
    final_endpoint = replace(endp, ".json" => "") # remove the .json
    base_keys = keys(API_INFO["resources"][base_endpoint])
    endp_array = [match(Regex("/$(final_endpoint)(.*)"), x) for x in String.(base_keys)]
    no_limit = sum([x!=nothing for x in endp_array])==0 #endp not in list, end eval
    no_limit && return Dict("remaining" => -1, "reset" => 0, "limit"=> -1)
    endp_name = [x.match for x in endp_array if x != nothing][1]
    # subtract the deduction if necessary
    API_INFO["resources"][base_endpoint][endp_name] -= endp_deduction
    return API_INFO["resources"][base_endpoint][endp_name]
end

# back off loop - this will reconnect when the API says it's OK
function reconnect(endp, reconnects=0)
    while get_endpoint_allocation(endp)["remaining"]==0
        reconnects += 1
        global API_INFO = nothing # reset the API INFO because 
        alloc = get_endpoint_allocation(eval(endp))
        cur_time = round(Int64, time())
        sleeptime = abs(alloc["reset"] - cur_time)
        println("Endpoint exhausted, sleeping for $sleeptime seconds..")
        sleep(sleeptime^reconnects)
    end
    return get_endpoint_allocation(endp, 1)
end
