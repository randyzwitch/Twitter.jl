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
