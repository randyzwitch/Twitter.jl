#############################################################
#
# General Functions
#
#############################################################

#Function that builds global variable to hold authentication keys
#TODO: Figure out how to do OAuth authentication directly, rather than user putting in credentials directly
function twitterauth(consumer_key::String, consumer_secret::String, oauth_token::String, oauth_secret::String)
    #Create a global variable to hold return from this function
    global twittercred

    return twittercred = TWCredential(consumer_key, consumer_secret, oauth_token, oauth_secret)

end

#General function for OAuth authenticated GET request
function get_oauth(endpoint::String, options::Dict)

    oauth_request_resource(endpoint, "GET", options, twittercred.consumer_key, twittercred.consumer_secret, twittercred.oauth_token, twittercred.oauth_secret)

end

#General function for OAuth authenticated POST request
function post_oauth(endpoint::String, options::Dict)

    oauth_request_resource(endpoint, "POST", options, twittercred.consumer_key, twittercred.consumer_secret, twittercred.oauth_token, twittercred.oauth_secret)

end
