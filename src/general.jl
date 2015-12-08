#############################################################
#
# General Functions
#
#############################################################

#Function that builds global variable to hold authentication keys
#TODO: Figure out how to do OAuth authentication directly, rather than user putting in credentials directly
function twitterauth(consumer_key::AbstractString, consumer_secret::AbstractString, oauth_token::AbstractString, oauth_secret::AbstractString)
    #Create a global variable to hold return from this function
    global twittercred

    return twittercred = TWCRED(consumer_key, consumer_secret, oauth_token, oauth_secret)

end

#General function for OAuth authenticated GET request
function get_oauth(endpoint::AbstractString, options::Dict)

    oauth_request_resource(endpoint, "GET", options, twittercred.consumer_key, twittercred.consumer_secret, twittercred.oauth_token, twittercred.oauth_secret)

end

#General function for OAuth authenticated POST request
function post_oauth(endpoint::AbstractString, options::Dict)

    oauth_request_resource(endpoint, "POST", options, twittercred.consumer_key, twittercred.consumer_secret, twittercred.oauth_token, twittercred.oauth_secret)

end